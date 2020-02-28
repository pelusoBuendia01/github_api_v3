//
//  GHProjectRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/projects/


import Foundation

internal class GHProjectRepository : ProjectRepo {
    
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    static let pathProjects         : String = "/projects"
    static let pathCollaborators    : String = "/collaborators"
    static let paramName            : String = "name"
    static let paramBody            : String = "body"
    

    // MARK: OVERRIDED PUBLIC PROPERTIES [ProjectRepository]
    //__________________________________________________________________________________________________________________
    var session         : GHSession
    var cards           : ProjectCardRepository
    var collaborators   : ProjectCollaboratorsRepository
    var columns         : ProjectColumnsRepository
    

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init                (session : GHSession) {
        self.session        = session
        self.cards          = GHProjectCardRepository           (session: session)
        self.collaborators  = GHProjectColaboratorsRepository   (session: session)
        self.columns        = GHProjectColumnsRepository        (session: session)
    }
    

    // MARK: OVERRIDED PUBLIC FUNCTIONS [ProjectRepository]
    //__________________________________________________________________________________________________________________
    
    func myProjects     (result: @escaping ProjectRepo.ResultProjectList) {
        
        /// initialize local variables
        let currentUserName = session.currentUsername()
        
        /// get projects for current user
        self.projectListOf(username: currentUserName) {
            listResult in
            switch (listResult) {
            case .failure(let error) :  do {
                result(.failure(error))
                }
            case .success(let list) : do {
                result(.success(list))
                }
            }
        }
        
    }
    
    func projectListOf  (username: String,
                         result: @escaping ResultProjectList) {
        
        /// initialize local variables
        let path : String   = "\(GHUserRepo.pathUsers)/\(username)\(GHProjectRepository.pathProjects)"
        
        /// execute  http get request
        session
            .get(
            path,
            with: nil) {
            RESTResult in
                switch (RESTResult) {
                case .failure(let error) : do {
                        result(.failure(error))
                    }
                    
                case .success(let response) : do {
                    
                    do {
                        let projects = try self.session.decoder.decode([GHProjectEntity].self, from: response.data)
                        
                        
                        result(.success(projects))
                    }
                    catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    }
                }
            
        }
        
    }
    
    func projectListOf  (organization: String,
                         result: @escaping ProjectRepo.ResultProjectList) {
        
        /// initialize local variables
        let path : String   = "\(GHOrganizationRepository.pathOrgs)/\(organization)\(GHProjectRepository.pathProjects)"
        
        /// execute  http get request
        session
            .get(
            path,
            with: nil) {
            RESTResult in
                switch (RESTResult) {
                case .failure(let error) : do {
                        result(.failure(error))
                    }
                    
                case .success(let response) : do {
                    
                    do {
                        let projects = try self.session.decoder.decode([GHProjectEntity].self, from: response.data)
                        result(.success(projects))
                    }
                    catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    }
                }
            
        }
    }
    
    func getProject     (id: Int,
                         result: @escaping ProjectRepo.ResultProject) {
        /// initialize local variables
        let path : String   = "\(GHProjectRepository.pathProjects)/\(id)"
        
        /// execute get http request
        session
            .get(
            path,
            with: nil) {
            RESTResult in
                switch (RESTResult) {
                case .failure(let error) : do {
                        result(.failure(error))
                    }
                    
                case .success(let response) : do {
                    
                    do {
                        let project = try self.session.decoder.decode(GHProjectEntity.self, from: response.data)
                        result(.success(project))
                    }
                    catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    }
                }
            
        }
    }
    
    func createProject  (name: String,
                         body: String,
                         result: @escaping ProjectRepo.ResultProject) {
        
        /// Initialize local variables
        let path : String   = "\(GHUserRepo.pathAuthenticated)\(GHProjectRepository.pathProjects)"
        let params : [String:Any?] = [
            GHProjectRepository.paramName: name,
            GHProjectRepository.paramBody: body,
        ]
        
        /// execute post http request
        session.post(
            path,
            with: params) {
                RESTResult in
                
                switch(RESTResult) {
                case .failure(let error) : do {
                    result(.failure(error))
                    }
                case .success(let response) : do {
                        
                    do {
                        let project = try self.session.decoder.decode(GHProjectEntity.self, from: response.data)
                        result(.success(project))
                    }
                    catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                    }
                }
        }
            
    }
    
    func deleteProject  (id: Int,
                         result: @escaping GHConfiguration.RESTConfirmation) {
        
        /// Initialize local variables
        let path : String   = "\(GHProjectRepository.pathProjects)/\(id)"
        
        /// excute http delete request
        session.delete(
            path,
            with: nil) {
                RESTResult in
                
                switch(RESTResult) {
                case .failure(let error) : do {
                    result(.failure(error))
                    }
                case .success(let response) : do {
                    
                    if (response.statusCode == 204) {
                        result(.success(true))
                    } else {
                        result(.success(false))
                    }
                    
                    }
                }
            
        }
        
        
    }
    
}

class GHProjectCardRepository : ProjectCardRepository {


    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    private static let pathMoves        : String = "/moves"
    private static let paramPosition    : String = "position"
    private static let paramNote        : String = "note"
    private static let paramArchived    : String = "archived"
    private static let paramContentId   : String = "content_id"
    private static let paramContentType : String = "content_type"


    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    static let pathCards : String = "/cards"


    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________

    var session: GHSession


    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________

    init                (session : GHSession) {
        self.session = session
    }
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func inColumn       (columnId       : Int,
                         result         : @escaping ProjectCardRepository.ResultCardList) {
        
        var path : String = GHProjectRepository.pathProjects
        path             += GHProjectColumnsRepository.pathColumns
        path             += "/\(columnId)"
        path             += GHProjectCardRepository.pathCards
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                
                do {
                    
                    let cards = try self.session.decoder.decode([GHProjectCardEntity].self, from: response.data)
                    result(.success(cards))
                    
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
                
            }
        }
        
    }
    
    func single         (cardId         : Int,
                         result         : @escaping ProjectCardRepository.ResultCard) {
        
        var path : String = GHProjectRepository.pathProjects
        path             += GHProjectColumnsRepository.pathColumns
        path             += GHProjectCardRepository.pathCards
        path             += "/\(cardId)"
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
            
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                do {
                    let card = try self.session.decoder.decode(GHProjectCardEntity.self, from: response.data)
                    result(.success(card))
                }
                catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
            }
                
            }
            
        }
        
    }
    
    func addNote        (note           : String,
                         in columnId    : Int,
                         result         : @escaping ProjectCardRepository.ResultCard) {
        
        /// initialize local variables
        var path : String    = GHProjectRepository.pathProjects
            path            += GHProjectColumnsRepository.pathColumns
            path            += "/\(columnId)"
            path            += GHProjectCardRepository.pathCards
        let params  : [String:Any?] = [
            GHProjectCardRepository.paramNote : note
        ]
        
        /// execute http post request
        session.post(path, with: params) {
            RESTResult in
            
            switch(RESTResult){
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do{
                
                do {
                    let cardNote = try self.session.decoder.decode(GHProjectCardEntity.self, from: response.data)
                    result(.success(cardNote))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
                
            }
            
        }
        
    }
    
    func addPullRequest (pullRequestId  : Int,
                         in columnId    : Int,
                         result         : @escaping ProjectCardRepository.ResultCard) {
        // TODO: 🏷 Implement it
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func addIssue       (pullRequestId  : Int,
                         in columnId    : Int,
                         result         : @escaping ProjectCardRepository.ResultCard) {
        // TODO: 🏷 Impement it
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func update         (note           : String,
                         of cardId      : Int,
                         result         : @escaping ProjectCardRepository.ResultCard) {
        
        /// initialize local variables
        var path : String    = GHProjectRepository.pathProjects
        path                += GHProjectColumnsRepository.pathColumns
        path                += GHProjectCardRepository.pathCards
        path                += "/\(cardId)"
        let params  : [String:Any?] = [
            GHProjectCardRepository.paramNote : note
        ]
        
        /// execute http patch request
        
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
            case .success(let response) : do {
                
                do {
                    let card = try self.session.decoder.decode(GHProjectCardEntity.self, from: response.data)
                    result(.success(card))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
                
            }
            
            
        }
        
    }
    
    func update         (archived       : Bool,
                         of cardId      : Int,
                         result         : @escaping ProjectCardRepository.ResultCard) {
    /// initialize local variables
    var path : String    = GHProjectRepository.pathProjects
    path                += GHProjectColumnsRepository.pathColumns
    path                += GHProjectCardRepository.pathCards
    path                += "/\(cardId)"
    let params  : [String:Any?] = [
        GHProjectCardRepository.paramArchived : archived
    ]
    
    /// execute http patch request
    
    session.patch(path, with: params) {
        RESTResult in
        
        switch(RESTResult) {
            
        case .failure(let error) : do {
            result(.failure(error))
            }
        case .success(let response) : do {
            
            do {
                let card = try self.session.decoder.decode(GHProjectCardEntity.self, from: response.data)
                result(.success(card))
            } catch {
                result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
            }
            
            }
            
        }
        
        
    }
}
    
    func delete         (cardId         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String    = GHProjectRepository.pathProjects
            path            += GHProjectColumnsRepository.pathColumns
            path            += GHProjectCardRepository.pathCards
        path            += "/\(cardId)"
        
        /// execute http delete request
        session.delete(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                
                if (response.statusCode == 204 ) {
                    result(.success(true))
                } else {
                    result(.success(false))
                }
                
                }
                
            }
        }
        
    }
    
    func moveTop        (cardId         : Int,
                         in ColumntId   : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String  = GHProjectRepository.pathProjects
            path          += GHProjectColumnsRepository.pathColumns
            path          += GHProjectCardRepository.pathCards
            path          += "/\(cardId)"
            path          += GHProjectCardRepository.pathMoves
        let params : [String:Any?] = [
            GHProjectCardRepository.paramPosition : "top"
        ]
        
        /// execute http post request
        session.post(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
            
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                
                if (response.statusCode == 201 ) {
                    result(.success(true))
                } else {
                    result(.success(false))
                }
                    
                }
            
            }
            
            
        }
               
    }
    
    func moveBottom     (cardId         : Int,
                         in ColumntId   : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) {
                             
        /// initialize local variables
         var path : String  = GHProjectRepository.pathProjects
             path          += GHProjectColumnsRepository.pathColumns
             path          += GHProjectCardRepository.pathCards
             path          += "/\(cardId)"
             path          += GHProjectCardRepository.pathMoves
         let params : [String:Any?] = [
             GHProjectCardRepository.paramPosition : "bottom"
         ]
         
         /// execute http post request
         session.post(path, with: params) {
             RESTResult in
             
             switch(RESTResult) {
             
             case .failure(let error) : do {
                 result(.failure(error))
                 }
                 
             case .success(let response) : do {
                 
                 if (response.statusCode == 201 ) {
                     result(.success(true))
                 } else {
                     result(.success(false))
                 }
                     
                 }
             
             }
             
             
         }
    }
    
    func move           (cardId         : Int,
                         in ColumntId   : Int,
                         after ReferenceId: Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String  = GHProjectRepository.pathProjects
            path          += GHProjectColumnsRepository.pathColumns
            path          += GHProjectCardRepository.pathCards
            path          += "/\(cardId)"
            path          += GHProjectCardRepository.pathMoves
        let params : [String:Any?] = [
            GHProjectCardRepository.paramPosition : "after:\(ReferenceId)"
        ]
        
        /// execute http post request
        session.post(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
            
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                
                if (response.statusCode == 201 ) {
                    result(.success(true))
                } else {
                    result(.success(false))
                }
                    
                }
            
            }
            
            
        }
    }
    
}

class GHProjectColaboratorsRepository : ProjectCollaboratorsRepository {
    
    // MARK: PRIVATE STATIC PROPERTIES
    
    //__________________________________________________________________________________________________________________
    
    static let paramAffiliation : String = "affiliation"
    static let pathPermission   : String = "/permission"
    static let paramPermission  : String = "permission"
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    
    var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init                    (session : GHSession) {
        self.session = session
    }
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func inProject          (id               : Int,
                             with affiliation : GHAffiliation?,
                             result           : @escaping ProjectCollaboratorsRepository.ResultCollaboratorList ) {
        
        /// Initialize local variables
        var path    : String    = "\(GHProjectRepository.pathProjects)/\(id)\(GHProjectRepository.pathCollaborators)"
                        
       
        if let affi = affiliation {
            path += "?\(GHProjectColaboratorsRepository.paramAffiliation)=\(affi.rawValue)"
        }
        
        	
        session.get(
            path,
            with: nil ) {
            RESTResult in
                
                switch(RESTResult) {
                case .failure(let error) : do {
                    result(.failure(error))
                    }
                case .success(let response) : do {
                    
                    do {
                        
                        let collaborators = try self.session.decoder.decode([GHUserEntity].self, from: response.data)
                        result(.success(collaborators))
                        
                    }
                    catch{
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    }
                }
                 
        }
        
    }
    
    func inProject          (id               : Int,
                             result           : @escaping ProjectCollaboratorsRepository.ResultCollaboratorList) {
        
        /// Initialize local variables
        let path    : String    = "\(GHProjectRepository.pathProjects)/\(id)\(GHProjectRepository.pathCollaborators)"
        
        /// execute get http request
        session.get(
            path,
            with: nil ) {
            RESTResult in
                
                switch(RESTResult) {
                case .failure(let error) : do {
                    result(.failure(error))
                    }
                case .success(let response) : do {
                    
                    do {
                        
                        let collaborators = try self.session.decoder.decode([GHUserEntity].self, from: response.data)
                        result(.success(collaborators))
                        
                    }
                    catch{
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    }
                }
                 
        }
    }
    
    func permissionLevel    (username       : String,
                             for id         : Int,
                             result         : @escaping ResultPermissionLevel) {

        /// Initialize local variables
        let path    : String    = "\(GHProjectRepository.pathProjects)/\(id)\(GHProjectRepository.pathCollaborators)/\(username)\(GHProjectColaboratorsRepository.pathPermission)"
        
        session.get(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                
                do {
                    let permision = try self.session.decoder.decode(GHProjectPermissionEntity.self, from: response.data)
                    
                    result(.success(permision))
                    
                } catch{
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription
                    )))
                }
                
                }
            }
        }
        
        
    }
    
    func add                (username       : String,
                             to projectId   : Int,
                             permisionLevel : GHPermission,
                             result         : @escaping GHConfiguration.RESTConfirmation) {
        
        /// Initialize local variables
        var path    : String    = "\(GHProjectRepository.pathProjects)/"
        path                   += "\(projectId)\(GHProjectRepository.pathCollaborators)/"
        path                   += "\(username)"
        
        let params : [String:Any?] = [
            GHProjectColaboratorsRepository.paramPermission: permisionLevel.rawValue
        ]
                
        session.put(path, with: params) {
            RESTResult in
            
            switch (RESTResult) {
            case .failure(let error) : do {
                result(.failure(error))
                }
            case .success(let response) : do {
                
                if (response.statusCode == 204) {
                    result(.success(true))
                } else{
                    result(.success(false))
                }
                
                
                }
            }
            
        }
        
        
       }
       
    
    
    func remove             (username       : String,
                             to projectId   : Int,
                             result         : @escaping GHConfiguration.RESTConfirmation) {
                
        /// Initialize local variables
        var path    : String    = "\(GHProjectRepository.pathProjects)/"
        path                   += "\(projectId)\(GHProjectRepository.pathCollaborators)/"
        path                   += "\(username)"
        
        session.delete(path, with: nil) {
            RESTResult in
            
            switch (RESTResult) {
            case .failure(let error) : do {
                result(.failure(error))
                }
            case .success(let response) : do {
                if (response.statusCode == 204) {
                    result(.success(true))
                } else{
                    result(.success(false))
                }
                }
            }
            
        }
           
    }
    
}

class GHProjectColumnsRepository : ProjectColumnsRepository {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    private static let paramName     : String = "name"
    private static let paramPosition : String = "position"
    private static let pathMoves     : String = "/moves"
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    static let pathColumns  : String = "/columns"
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    
    var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init            (session : GHSession) {
        self.session = session
    }
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func inProject  (id             : Int,
                     result         : @escaping ProjectColumnsRepository.ResultColumnList) {
        
        
        /// Initialize local variables
        var path    : String    = "\(GHProjectRepository.pathProjects)/"
        path                   += "\(id)"
        path                   += "\(GHProjectColumnsRepository.pathColumns)"
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                
                do {
                    let columns = try self.session.decoder.decode([GHProjectColumnEntity].self, from: response.data)
                    result(.success(columns))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
            }
            
        }
        
    }
    
    func single     (columnId         : Int,
                     result         : @escaping ProjectColumnsRepository.ResultColumn) {
        
        /// Initialize local variables
        var path    : String    = "\(GHProjectRepository.pathProjects)"
        path                   += "\(GHProjectColumnsRepository.pathColumns)/"
        path                   += "\(columnId)"
        
        session.get(path, with: nil) {
            RESTResult in
            switch(RESTResult) {
            case .failure(let error) : do {
                result(.failure(error))
                }
            case .success(let respone) : do {
                
                do {
                    let column = try self.session.decoder.decode(GHProjectColumnEntity.self, from: respone.data)
                    result(.success(column))
                } catch{
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
                
                
            }
        }
        
    }
    
    func create     (name           : String,
                     in projectId   : Int,
                     result         : @escaping ProjectColumnsRepository.ResultColumn) {
        
        /// Initialize local variables
        var path    : String    = "\(GHProjectRepository.pathProjects)/"
        path                   += "\(projectId)"
        path                   += "\(GHProjectColumnsRepository.pathColumns)"
        
        let params : [String:Any?] = [
            GHProjectColumnsRepository.paramName : name
        ]
        
        /// execute http post req  request
        session.post(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
            case .failure(let error) : do {
                result(.failure(error))
                }
            case .success(let response) : do {
                
                do {
                    let column = try self.session.decoder.decode(GHProjectColumnEntity.self, from: response.data)
                    result(.success(column))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
            }
            
            
        }
        
    }
    
    func update     (name           : String,
                     of columnId    : Int,
                     result         : @escaping ProjectColumnsRepository.ResultColumn) {
        
        /// Initialize local variables
        var path    : String    = "\(GHProjectRepository.pathProjects)"
        path                   += "\(GHProjectColumnsRepository.pathColumns)/"
        path                   += "\(columnId)"
        
        let params : [String: Any?] = [
            GHProjectColumnsRepository.paramName : name
        ]
        
        session.patch(path, with: params) {
            RESTResult  in
            
            switch (RESTResult)  {
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                
                do {
                    let column = try self.session.decoder.decode(GHProjectColumnEntity.self, from: response.data)
                    result(.success(column))
                    
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                
                }
            }
        }
                
    }
    
    func delete     (columnId       : Int,
                     result         : @escaping GHConfiguration.RESTConfirmation) {

        /// Initialize local variables
        var path    : String    = "\(GHProjectRepository.pathProjects)"
        path                   += "\(GHProjectColumnsRepository.pathColumns)/"
        path                   += "\(columnId)"
        
        session.delete(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
            case .failure(let error) : do {
                result(.failure(error))
                }
            case .success(let response) : do {
                
                if (response.statusCode == 204) {
                    result(.success(true))
                } else {
                    result(.success(false))
                }
                
                
                }
            }
            
        }
    }
    
    func moveFirst  (columnId       : Int,
                     result         : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String = GHProjectRepository.pathProjects
        path             += GHProjectColumnsRepository.pathColumns+"/"
        path             += "\(columnId)"
        path             += GHProjectColumnsRepository.pathMoves
        
        let params : [String:Any?] = [
            GHProjectColumnsRepository.paramPosition : "first"
        ]
        
        /// execute http post method
        session.post(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response ) : do {
                
                if (response.statusCode == 201 ) {
                    result(.success(true))
                }else {
                    result(.success(false))
                }
                
                
                }
            }
        }
                
    }
    
    func moveLast   (columnId       : Int,
                     result         : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String = GHProjectRepository.pathProjects
        path             += GHProjectColumnsRepository.pathColumns+"/"
        path             += "\(columnId)"
        path             += GHProjectColumnsRepository.pathMoves
        
        let params : [String:Any?] = [
            GHProjectColumnsRepository.paramPosition : "last"
        ]
        
        /// execute http post method
        session.post(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response ) : do {
                
                if (response.statusCode == 201 ) {
                    result(.success(true))
                }else {
                    result(.success(false))
                }
                
                
                }
            }
        }
    }
    
    func move       (columnId       : Int,
                     after referenceID: Int,
                     result         : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String = GHProjectRepository.pathProjects
        path             += GHProjectColumnsRepository.pathColumns+"/"
        path             += "\(columnId)"
        path             += GHProjectColumnsRepository.pathMoves
        
        let params : [String:Any?] = [
            GHProjectColumnsRepository.paramPosition : "after:\(referenceID)"
        ]
        
        /// execute http post method
        session.post(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response ) : do {
                
                if (response.statusCode == 201 ) {
                    result(.success(true))
                }else {
                    result(.success(false))
                }
                
                
                }
            }
        }
        
        
    }
    
    
    
}
