//
//  GHUserRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/users/

import Foundation

internal class GHUserRepo: UserRepo {
   
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    private static let paramName            : String = "name"
    private static let paramEmail           : String = "email"
    private static let paramBlog            : String = "blog"
    private static let paramCompany         : String = "company"
    private static let paramLocation        : String = "location"
    private static let paramHireable        : String = "hireable"
    private static let paramBio             : String = "bio"
    private static let paramSince           : String = "since"
    private static let pathBlocks           : String = "/blocks"
    
    
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    static let pathUsers            : String = "/users"
    static let pathAuthenticated    : String = "/user"
    static let pathHovercard    : String = "/hovercard"
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    public var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    public init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDED PUBLIC FUNCTIONS [UserRepository]
    //__________________________________________________________________________________________________________________
    
    public func authenticated  (result     : @escaping ResultUser) {
        /// Initialize local variables
        let path = "/user"
        
        session.get(path, with: nil) {
            RESTtResult in
            switch (RESTtResult) {
            case .failure(let error) : do {
                result(.failure(error))
                }
            case .success(let response) : do {
                
                do {
                    let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                    result(.success((user)))
                }
                catch {
                    
                }
                
                
                }
            }
        }
    }
    
    public func updateName     (_ name     : String?,
                                result     : @escaping ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepo.paramName: name
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepo.pathAuthenticated ,
                with        : params ) {
                    RESTResult in
                    
                    switch(RESTResult) {
                        
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                    case .success(let response) : do {
                        
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(.success(user))
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        
                        }
                    }
                        
            }
        
                    
    }
    
    public func updateEmail    (_ email    : String?,
                                result     : @escaping ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepo.paramEmail: email
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepo.pathAuthenticated ,
                with        : params                ) {
                RESTResult in
                    
                    switch (RESTResult) {
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                    case .success(let response) : do {
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(
                                .success(user)
                            )
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        }
                    }
        }
    }
        
    public func updateBlog     (_ blog     : String?,
                                result     : @escaping ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepo.paramBlog: blog
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepo.pathAuthenticated ,
                with        : params ) {
                RESTResult in
                    
                    switch (RESTResult) {
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                    case .success(let response) : do {
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(
                                .success(user)
                            )
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        }
                    }
                    
        }
    }
    
    public func updateCompany  (_ company  : String?,
                                result     : @escaping ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepo.paramCompany: company
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepo.pathAuthenticated ,
                with        : params) {
                    RESTResult in
                    
                    switch (RESTResult) {
                        
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                        
                    case .success(let response) : do {
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(
                                .success(user)
                            )
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        }
                        
                    }
        }
    }
    
    public func updateLocation (_ location : String?,
                                result     : @escaping ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepo.paramLocation: location
        ]
        
        session.patch(
            GHUserRepo.pathAuthenticated,
            with: params ) {
            RESTResult in
            
            switch (RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                do {
                    let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                    result(
                        .success(user)
                    )
                }
                catch {
                    result(
                        .failure(
                            GHSession.SessionError.decodingError(
                                message: error.localizedDescription
                            )
                        )
                    )
                }
                }
                
            }
        }
    }
    
    public func updateHireable (_ hireable : Bool?,
                                result     : @escaping ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepo.paramHireable: hireable
        ]
        
        /// Get path from session
        session.patch(
            GHUserRepo.pathAuthenticated ,
            with        : params ) {
                RESTResult in
                
                switch (RESTResult) {
                    
                case .failure(let error) : do {
                    result(.failure(error))
                    }
                    
                case .success(let response) : do {
                    do {
                        let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                        result(
                            .success(user)
                        )
                    }
                    catch {
                        result(
                            .failure(
                                GHSession.SessionError.decodingError(
                                    message: error.localizedDescription
                                )
                            )
                        )
                    }
                    }
                    
                }
        }
    }
    
    public func updateBio      (_ bio      : String?,
                                result     : @escaping ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepo.paramBio: bio
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepo.pathAuthenticated,
                with        : params ) {
                    RESTResult in
                    
                    switch (RESTResult) {
                        
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                        
                    case .success(let response) : do {
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(
                                .success(user)
                            )
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        }
                    }
        }
    }
    
    public func single         (from username   : GHConfiguration.Username,
                                result          : @escaping ResultUser) {
        /// Initialize local variables
        let path = "\(GHUserRepo.pathUsers)/\(username)"
        
        /// Get path from session
        session.get(
            path,
            with        : nil )  {
               RESTResult in
               
               switch (RESTResult) {
                   
               case .failure(let error) : do {
                   result(.failure(error))
                   }
                   
               case .success(let response) : do {
                   do {
                       let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                       result(
                           .success(user)
                       )
                   }
                   catch {
                       result(
                           .failure(
                               GHSession.SessionError.decodingError(
                                   message: error.localizedDescription
                               )
                           )
                       )
                   }
                   }
               }
        }
    }
    
    public func singleHovercard(from username   : String,
                                result          : @escaping ResultUserHovercardList) {
        /// Initialize local variables
        var path : String    = GHUserRepo.pathUsers
        path                += "/\(username)"
        path                += GHUserRepo.pathHovercard
        
        /// Get path from session
        session.get(
            path,
            with        : nil )  {
               RESTResult in
               
               switch (RESTResult) {
                   
               case .failure(let error) :
                do {
                   result(.failure(error))
                }
                   
               case .success(let response) :
                do {
                    
                   do {
                                        
                    let hovercards = try self.session.decoder.decode(GHUserHoverCardEntity.self, from: response.data)
                    result( .success(hovercards) )                                        
                   }
                   catch {
                    
                       result(
                           .failure(
                               GHSession.SessionError.decodingError(
                                   message: error.localizedDescription
                               )
                           )
                       )
                   }
                    
                }
               
                }
        }
    }
    
    public func list           (starting since  : GHConfiguration.ID?,
                                result          : @escaping ResultUserList) {
        /// Initialize local variables
        let path : String
        
        /// Determine what parameters to use
        if let since = since {
            path = "\(GHUserRepo.pathUsers)?\(GHUserRepo.paramSince)=\(since)"
        } else {
            path = GHUserRepo.pathUsers
        }
         
        /// Get path from session
        session
            .get(
                path,
                with        : nil )  {
                   RESTResult in
                   
                   switch (RESTResult) {
                       
                   case .failure(let error) : do {
                       result(.failure(error))
                       }
                       
                   case .success(let response) : do {
                       do {
                           let users = try self.session.decoder.decode([GHUserEntity].self, from: response.data)
                           result(
                               .success(users)
                           )
                       }
                       catch {
                           result(
                               .failure(
                                   GHSession.SessionError.decodingError(
                                       message: error.localizedDescription
                                   )
                               )
                           )
                       }
                       }
                   }
            }
    }
    
    // MARK: BLOCKING FUNCTION
    //__________________________________________________________________________________________________________________
    
    public func blockedUsers   (result      : @escaping ResultUserList) {
        /// Get path from session
        session
            .get(
                "\(GHUserRepo.pathAuthenticated)\(GHUserRepo.pathBlocks)",
                with        : nil ) {
                    RESTResult in
                    
                    switch (RESTResult) {
                    case .failure(let error): do {
                        result(.failure(error))
                        }
                    case .success(let response) : do {
                        
                        do {
                            let users = try self.session.decoder.decode([GHUserEntity].self, from: response.data)
                            result(
                                .success(
                                    users
                                )
                            )
                        }
                        catch {
                            
                            result(.failure(
                                GHSession.SessionError.decodingError(
                                    message: error.localizedDescription
                                )
                            ))
                        }
                        
                        
                        }
                    }
        }
    }
    
    public func verifyIf       (isBlocked username: GHConfiguration.Username,
                                result      : @escaping GHConfiguration.RESTConfirmation) {
        
        /// Initialize local variables
       let path : String = "\(GHUserRepo.pathAuthenticated)\(GHUserRepo.pathBlocks)/\(username)"
       
       /// Determine what parameters to use
        session
            .get(path,
                 with: nil ) {
                RESTResult in
                
                switch(RESTResult){

                case .failure( _ ) : do {
                    result(.success(false))
                    }
                    
                case .success( _ ) : do {
                    result(.success(true))
                    }
                    
                }
        }
    }
    
    public func block          (username    : GHConfiguration.Username,
                                result      : @escaping GHConfiguration.RESTConfirmation) {
        
        /// Initialize local variables
        let path : String = "\(GHUserRepo.pathAuthenticated)\(GHUserRepo.pathBlocks)/\(username)"
          
        /// Determine what parameters to use
        session
            .put(path,
                with: nil ) {
                RESTResult in
                   
                switch(RESTResult){
                   
                case .failure( _ ) : do {
                    result(.success(false))
                    }
                       
                case .success( _ ) : do {
                    result(.success(true))
                    }
                       
                }
           }
    }
    
    public func unblock        (username    : GHConfiguration.Username,
                                result      : @escaping GHConfiguration.RESTConfirmation) {
                             
        /// Initialize local variables
        let path : String = "\(GHUserRepo.pathAuthenticated)\(GHUserRepo.pathBlocks)/\(username)"
        
        /// Determine what parameters to use
        session
            .delete(path,
                with: nil ) {
                RESTResult in
                
                switch(RESTResult){
                    
                case .failure( _ ) : do {
                    result(.success(false))
                    }
                        
                case .success( _ ) : do {
                    result(.success(true))
                    }
                    
                }
            }
        
    }
            
}
