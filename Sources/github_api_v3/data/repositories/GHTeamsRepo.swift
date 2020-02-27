//
//  File.swift
//  
//
//  Created by Francisco Romero on 15/02/20.
//

import Foundation


internal class GHTeamsRepo: TeamsRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    
    public var session: GHSession
    
    let discussion          : TeamsDiscussionCommentsRepo
    let discussionComments  : TeamsDiscussionCommentsRepo
    let members             : TeamsMembersRepo
    let synchronization     : TeamsSynchronizationRepo
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        
        /// initialize instance variables
        self.session = session
        
        self.discussion         =  GHTeamsDiscussionCommentsRepo(session: self.session)
        self.discussionComments =  GHTeamsDiscussionCommentsRepo(session: self.session)
        self.members            =  GHTeamsMembersRepo(session: self.session)
        self.synchronization   =  GHTeamsSynchronizationRepo(session: self.session)
        
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________

    
    func listTeams  (result         : @escaping ResultTeamList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.listTeams : 🚧 not implemented")))
    }
    
    func getBy      (name           : String,
                     result         : @escaping ResultTeam) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.getBy : 🚧 not implemented")))
    }
    
    func create     (name           : String,
                     description    : String?,
                     mainteiners    : [String]?,
                     repoNames      : [String]?,
                     privacy        : TeamPrivacy?,
                     permission     : TeamPermission?,
                     parentTeamId   : Int?,
                     result         : @escaping ResultTeam) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.create : 🚧 not implemented")))
    }
    
    func update     (slug           : String,
                     in org         : Int,
                     name           : String,
                     description    : String?,
                     privacy        : TeamPrivacy?,
                     permission     : TeamPermission?,
                     parentTeamId   : Int?,
                     result         : @escaping ResultTeam) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.update : 🚧 not implemented")))
    }
    
    func delete     (slug           : String,
                     in org         : Int,
                     result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.delete : 🚧 not implemented")))
    }
    
    func childTeams (slug           : String,
                     in org         : Int,
                     result         : @escaping ResultTeamList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.childTeams : 🚧 not implemented")))
    }
    
    func reposOf    (slug           : String,
                     in org         : Int,
                     result         : @escaping (Result<[String], Error>) -> Void) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.reposOf : 🚧 not implemented")))
    }
    
    func verifyRepo (owner          : String,
                     repo           : String,
                     managedBy slug : String,
                     in org         : Int,
                     result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.verifyRepo : 🚧 not implemented")))
    }
    
    func addOrupdateRepo(owner          : String,
                         repo           : String,
                         managedBy slug : String,
                         in org         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.addOrupdateRepo : 🚧 not implemented")))
    }
    
    func removeRepo (owner          : String,
                     repo           : String,
                     managedBy slug : String,
                     in org         : Int,
                     result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.removeRepo : 🚧 not implemented")))
    }
    
    func authorizedTeams(result: @escaping ResultTeamList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.authorizedTeams : 🚧 not implemented")))
    }
    
    func projects   (in slug        : String,
                     org            : Int,
                     result         : @escaping (Result<[ProjectEntity], Error>) -> Void) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsRepo.projects : 🚧 not implemented")))
    }
    
    
    
}


internal class GHTeamsDiscussionRepo: TeamsDiscussionRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    
    public var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________

    
}


internal class GHTeamsDiscussionCommentsRepo: TeamsDiscussionCommentsRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    
    public var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________

    
}


internal class GHTeamsMembersRepo: TeamsMembersRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    
    public var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________

    
}

internal class GHTeamsSynchronizationRepo: TeamsSynchronizationRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    
    public var session: GHSession
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________

    
}
