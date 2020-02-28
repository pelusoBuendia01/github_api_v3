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
    
    let discussion          : TeamsDiscussionRepo
    let discussionComments  : TeamsDiscussionCommentsRepo
    let members             : TeamsMembersRepo
    let synchronization     : TeamsSynchronizationRepo
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        
        /// initialize instance variables
        self.session = session
        
        self.discussion         =  GHTeamsDiscussionRepo(session: self.session)
        self.discussionComments =  GHTeamsDiscussionCommentsRepo(session: self.session)
        self.members            =  GHTeamsMembersRepo(session: self.session)
        self.synchronization    =  GHTeamsSynchronizationRepo(session: self.session)
        
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

    func listDiscussions    (in slug        : String,
                             orgId          : Int,
                             team_Id        : Int,
                             result         : @escaping ResultDiscussionList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionRepo.listDiscussions : 🚧 not implemented")))
    }
    
    func single             (discussionNumber: Int,
                             in slug        : String,
                             orgId          : Int,
                             team_Id        : Int,
                             result         : @escaping ResultDiscussion) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionRepo.single : 🚧 not implemented")))
    }
    
    func create             (title          : Int,
                             required       : Int,
                             isPrivate      : Bool,
                             orgId          : Int,
                             team_Id        : Int,
                             result         : @escaping ResultDiscussion) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionRepo.create : 🚧 not implemented")))
    }
    
    func update             (discussionNumber: Int,
                             title          : Int?,
                             required       : Int?,
                             isPrivate      : Bool?,
                             orgId          : Int,
                             team_Id        : Int,
                             result         : @escaping ResultDiscussion) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionRepo.update : 🚧 not implemented")))
    }
    
    func delete             (discussionNumber: Int,
                             in slug        : String,
                             orgId          : Int,
                             result         : @escaping ResultDiscussion) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionRepo.delete : 🚧 not implemented")))
    }
    
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
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [TeamsDiscussionCommentsRepo]
    //__________________________________________________________________________________________________________________

    
    func listComments       (result: @escaping ResultDiscussionCommentList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionCommentsRepo.listComments : 🚧 not implemented")))
    }
    
    func single             (commentNumber  : Int,
                             disussionNumber: Int,
                             slug           : String,
                             org            : String,
                             result         : @escaping ResultDiscussionComment) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionCommentsRepo.single : 🚧 not implemented")))
    }
    
    func create             (body           : String,
                             disussionNumber: Int,
                             slug           : String,
                             org            : String,
                             result         : @escaping ResultDiscussionComment) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionCommentsRepo.create : 🚧 not implemented")))
    }
    
    func edit               (body           : String,
                             commentNumber  : Int,
                             disussionNumber: Int,
                             slug           : String,
                             org            : String,
                             result         : @escaping ResultDiscussionComment) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionCommentsRepo.edit : 🚧 not implemented")))
    }
    
    func delete             (commentNumber  : Int,
                             disussionNumber: Int,
                             slug           : String,
                             org            : String,
                             result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsDiscussionCommentsRepo.delete : 🚧 not implemented")))
    }
    
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

    func listMembers            (orgId      : Int,
                                 teamId     : Int,
                                 role       : TeamRole?,
                                 result     : @escaping UserRepo.ResultUserList ) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsMembersRepo.listMembers : 🚧 not implemented")))
    }
    
    func getMembership          (orgId      : Int,
                                 teamId     : Int,
                                 username   : String,
                                 result     : @escaping ResultMembership) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsMembersRepo.getMembership : 🚧 not implemented")))
    }
    
    
    func addOrUpdateMembership  (username   : String,
                                 orgId      : Int,
                                 teamId     : Int,
                                 result     : @escaping ResultMembership) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsMembersRepo.addOrUpdateMembership : 🚧 not implemented")))
    }
    
    func removeMembership       (username   : String,
                                 orgId      : Int,
                                 teamId     : Int,
                                 result     : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsMembersRepo.removeMembership : 🚧 not implemented")))
    }
    
    func listPendingInvitations (orgId      : Int,
                                 teamId     : Int,
                                 result     : @escaping ResultInvitationList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsMembersRepo.listPendingInvitations : 🚧 not implemented")))
    }
    
    
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

    func listGroups         (in orgId   : Int,
                             result     : @escaping ResultIdPList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsSynchronizationRepo.listGroups : 🚧 not implemented")))
    }
    
    func listGroups         (for teamId : Int,
                             result     : @escaping ResultIdPList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsSynchronizationRepo.listGroups : 🚧 not implemented")))
    }
    
    func createOrUpodate    (for teamId : Int,
                             result     : @escaping ResultIdP) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHTeamsSynchronizationRepo.createOrUpodate : 🚧 not implemented")))
    }
    
    
    
}
