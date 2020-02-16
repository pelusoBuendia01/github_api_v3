//
//  ProjectRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com

import Foundation

public protocol ProjectRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultProject     = (Result< ProjectEntity    ,Error> ) -> Void
    typealias ResultProjectList = (Result<[ProjectEntity]   ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    var cards           : ProjectCardRepository             { get }
    var collaborators   : ProjectCollaboratorsRepository    { get }
    var columns         : ProjectColumnsRepository          { get }
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    /// myProjects
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
    func myProjects     (result         : @escaping ResultProjectList   ) -> Void
    
    /// projectListOf
    ///
    /// - parameter username: the username where projects will be search
    /// - parameter result: the callback competition
    /// - returns: Void
    func projectListOf  (username       : String                        ,
                         result         : @escaping ResultProjectList   ) -> Void
    
    /// projectListOf
    ///
    /// - parameter organization: the organization name where projects will be search
    /// - parameter result: the callback competition
    /// - returns: Void
    func projectListOf  (organization   : String                        ,
                         result         : @escaping ResultProjectList   ) -> Void
    
    /// getProject
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
    func getProject      (id            : Int                           ,
                         result         : @escaping ResultProject       ) -> Void
    
    /// createProject
    ///
    /// - parameter name: the name string of new project
    /// - parameter body: the body string of new project
    /// - parameter result: the callback competition
    /// - returns: Void
    func createProject  (name           : String                        ,
                         body           : String                        ,
                         result         : @escaping ResultProject       ) -> Void
    
    /// deleteProject
    ///
    /// - parameter id: the project id to be deleted
    /// - parameter result: the callback competition
    /// - returns: Void
    func deleteProject  (id             : Int                           ,
                         result         : @escaping GHConfiguration.RESTConfirmation ) -> Void
    
}


public protocol ProjectCardRepository : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultCardList    = (Result<[ProjectCardEntity], Error> ) -> Void
    typealias ResultCard        = (Result<ProjectCardEntity  , Error> ) -> Void
    
    /// inColumn
    ///
    /// - parameter columnId: the column Id to search card
    /// - parameter result: the callback competition
    /// - returns: Void
    func inColumn       (columnId       : Int,
                         result         : @escaping ResultCardList)
    
    ///
    ///
    /// - parameter cardId: the card id to be found
    /// - parameter result: the callback competition
    /// - returns: Void
    func single         (cardId         : Int,
                         result         : @escaping ResultCard)
    
    /// addNote
    ///
    /// - parameter note: the note to be added
    /// - parameter result: the callback competition
    /// - returns: Void
    func addNote        (note           : String,
                         in columnId    : Int,
                         result         : @escaping ResultCard)
    
    /// addPullRequest
    ///
    /// - parameter pullRequestId: the pul lrequest Id number
    /// - parameter of_CardId: the card id to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func addPullRequest (pullRequestId  : Int,
                         in columnId    : Int,
                         result         : @escaping ResultCard)
    
    /// addIssue
    ///
    /// - parameter pullRequestId: the pul lrequest Id number to add
    /// - parameter of_CardId: the card id to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func addIssue       (pullRequestId  : Int,
                         in columnId    : Int,
                         result         : @escaping ResultCard)
    
    /// update
    ///
    /// - parameter note: the note string
    /// - parameter of_CardId: the card id to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func update         (note           : String,
                         of cardId      : Int,
                         result         : @escaping ResultCard)
    
    /// update
    ///
    /// - parameter archived: the archived state
    /// - parameter of_CardId: the card id to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func update         (archived       : Bool,
                         of cardId      : Int,
                         result         : @escaping ResultCard)
    
    /// delete
    ///
    /// - parameter cardId: the card id to delete
    /// - parameter result: the callback competition
    /// - returns: Void
    func delete         (cardId         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation)
    
    /// moveTop
    ///
    /// - parameter cardId: the card id
    /// - parameter in_ColumntId: the column where will be moved
    /// - parameter result: the callback competition
    /// - returns: Void
    func moveTop        (cardId         : Int,
                         in ColumntId   : Int,
                          result        : @escaping GHConfiguration.RESTConfirmation)
    
    /// moveBottom
    ///
    /// - parameter cardId: the card id
    /// - parameter in_ColumntId: the column where will be moved
    /// - parameter result: the callback competition
    /// - returns: Void
    func moveBottom     (cardId         : Int,
                         in ColumntId   : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation)
    
    /// move
    ///
    /// - parameter cardId: the card id
    /// - parameter in_ColumntId: the column where will be moved
    /// - parameter after_ReferenceId: the  cardId afte where will be moved after it
    /// - returns: Void
    func move           (cardId             : Int,
                        in ColumntId        : Int,
                        after ReferenceId   : Int,
                        result              : @escaping GHConfiguration.RESTConfirmation)
}


public protocol ProjectCollaboratorsRepository : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultCollaboratorList     = (Result<[UserEntity]             ,Error> ) -> Void
    typealias ResultPermissionLevel      = (Result<ProjectPermissionEntity  ,Error> ) -> Void
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    ///
    ///
    /// - parameter id: the project id to be searched
    /// - parameter with_affiliation: the affiliation filter
    /// - parameter result: the callback competition
    /// - returns: Void
    func inProject          (id                 : Int,
                             with affiliation   : GHAffiliation?,
                             result             : @escaping ResultCollaboratorList )
    
    ///
    ///
    /// - parameter id: the project id to be search
    /// - parameter result: the callback competition
    /// - returns: Void
    func inProject          (id                 : Int,
                             result             : @escaping ResultCollaboratorList )
    
    ///
    ///
    /// - parameter username: the username to be searched
    /// - parameter for_id: the project id reference
    /// - parameter result: the callback competition
    /// - returns: Void
    func permissionLevel    (username           : String,
                             for id             : Int,
                             result             : @escaping ResultPermissionLevel )
    
    ///
    ///
    /// - parameter username: the username to be added
    /// - parameter to_projectId: the project id to be updated
    /// - parameter result: the callback competition
    /// - returns: Void
    func add                (username           : String ,
                             to projectId       : Int,
                             permisionLevel     : GHPermission,
                             result             : @escaping GHConfiguration.RESTConfirmation )
    
    ///
    ///
    /// - parameter username: the username to be removed
    /// - parameter to_projectId: the project id to be updated
    /// - parameter result: the callback competition
    /// - returns: Void
    func remove             (username           : String ,
                             to projectId       : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation )
    
}


public protocol ProjectColumnsRepository : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultColumnList = (Result<[ProjectColumnEntity], Error> ) -> Void
    typealias ResultColumn     = (Result<ProjectColumnEntity  , Error> ) -> Void
      
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    /// inProject
    ///
    /// - parameter id: the project id to search
    /// - parameter result: the callback competition
    /// - returns: Void
    func inProject          (id                 : Int,
                             result             : @escaping ResultColumnList)
    
    
    /// single
    ///
    /// - parameter columnId: the column id to search
    /// - parameter result: the callback competition
    /// - returns: Void
    func single             (columnId             : Int,
                             result             : @escaping ResultColumn)
    
    /// create
    ///
    /// - parameter name: the name of new column
    /// - parameter in_projectId: the project id where column will be created
    /// - parameter result: the callback competition
    /// - returns: Void
    func create             (name               : String,
                             in projectId       : Int,
                             result             : @escaping ResultColumn)
    
    /// update
    ///
    /// - parameter name: the new name
    /// - parameter columnId: the column id to be updated
    /// - parameter result: the callback competition
    /// - returns: Void
    func update             (name               : String,
                             of columnId        : Int,
                             result             : @escaping ResultColumn)
    
    /// delete
    ///
    /// - parameter columnId: the column id to be deleted
    /// - parameter result: the callback competition
    /// - returns: Void
    func delete             (columnId           : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation)
    
    
    /// moveFirst
    ///
    /// - parameter columnId: the column id to be moved
    /// - parameter result: the callback competition
    /// - returns: Void
    func moveFirst          (columnId           : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation)
    
    /// moveLast
    ///
    /// - parameter columnId: the column id to be moved
    /// - parameter result: the callback competition
    /// - returns: Void
    func moveLast           (columnId           : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation)
    
    /// move
    ///
    /// - parameter columnId: the column id to be moved
    /// - parameter after_referenceId: the column id refence position
    /// - parameter result: the callback competition
    /// - returns: Void
    func move               (columnId           : Int,
                             after referenceID  : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation)
    
}
