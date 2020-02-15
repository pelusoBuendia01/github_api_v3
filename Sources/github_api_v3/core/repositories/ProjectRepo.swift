//
//  ProjectRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 02/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol ProjectRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultProject     = (Result< ProjectEntity    ,Error> ) -> Void
    typealias ResultProjectList = (Result<[ProjectEntity]   ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    var cards           : ProjectCardRepository             {get set}
    var collaborators   : ProjectCollaboratorsRepository    {get set}
    var columns         : ProjectColumnsRepository          {get set}
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    func myProjects     (result         : @escaping ResultProjectList   ) -> Void
    
    func projectListOf  (username       : String                        ,
                         result         : @escaping ResultProjectList   ) -> Void
    
    func projectListOf  (organization   : String                        ,
                         result         : @escaping ResultProjectList   ) -> Void
    
    func getProject      (id            : Int                           ,
                         result         : @escaping ResultProject       ) -> Void
    
    func createProject  (name           : String                        ,
                         body           : String                        ,
                         result         : @escaping ResultProject       ) -> Void
    
    func deleteProject  (id             : Int                           ,
                         result         : @escaping GHConfiguration.RESTConfirmation ) -> Void
    
}


public protocol ProjectCardRepository : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultCardList    = (Result<[ProjectCardEntity], Error> ) -> Void
    typealias ResultCard        = (Result<ProjectCardEntity  , Error> ) -> Void
    
    func inColumn       (columnId       : Int,
                         result         : @escaping ResultCardList)
    
    func single         (cardId         : Int,
                         result         : @escaping ResultCard)
    
    func addNote        (note           : String,
                         in columnId    : Int,
                         result         : @escaping ResultCard)
    
    func addPullRequest (pullRequestId  : Int,
                         in columnId    : Int,
                         result         : @escaping ResultCard)
    
    func addIssue       (pullRequestId  : Int,                         
                         in columnId    : Int,
                         result         : @escaping ResultCard)
    
    func update         (note           : String,
                         of cardId      : Int,
                         result         : @escaping ResultCard)
    
    func update         (archived       : Bool,
                         of cardId      : Int,
                         result         : @escaping ResultCard)
    
    func delete         (cardId         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation)
    
    func moveTop        (cardId         : Int,
                         in ColumntId   : Int,
                          result        : @escaping GHConfiguration.RESTConfirmation)
    
    func moveBottom     (cardId         : Int,
                         in ColumntId   : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation)
    
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
    
    // MARK: ENUMS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    func inProject          (id                 : Int,
                             with affiliation   : GHAffiliation?,
                             result             : @escaping ResultCollaboratorList )
    
    func inProject          (id                 : Int,
                             result             : @escaping ResultCollaboratorList )
    
    func permissionLevel    (username           : String,
                             for id             : Int,
                             result             : @escaping ResultPermissionLevel )
    
    func add                (username           : String ,
                             to projectId       : Int,
                             permisionLevel     : GHPermission,
                             result             : @escaping GHConfiguration.RESTConfirmation )
    
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
    func inProject          (id                 : Int,
                             result             : @escaping ResultColumnList)
    
    func single             (columnId             : Int,
                             result             : @escaping ResultColumn)
    
    func create             (name               : String,
                             in projectId       : Int,
                             result             : @escaping ResultColumn)
    
    func update             (name               : String,
                             of columnId        : Int,
                             result             : @escaping ResultColumn)
    
    func delete             (columnId           : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation)
    
    
    func moveFirst          (columnId           : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation)
    
    func moveLast           (columnId           : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation)
    
    func move               (columnId           : Int,
                             after referenceID  : Int,
                             result             : @escaping GHConfiguration.RESTConfirmation)
    
}
