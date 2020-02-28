//
//  TeamsRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com

import Foundation

public protocol TeamsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultTeam            = (Result< TeamEntity   ,Error> ) -> Void
    typealias ResultTeamList        = (Result<[TeamEntity]  ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    var discussion          : TeamsDiscussionRepo           { get }
    var discussionComments  : TeamsDiscussionCommentsRepo   { get }
    var members             : TeamsMembersRepo              { get }
    var synchronization     : TeamsSynchronizationRepo      { get }
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
    func listTeams      (result         : @escaping ResultTeamList ) -> Void
    
    func getBy          (name           : String,
                         result         : @escaping ResultTeam ) -> Void
    
    func create         (name           : String,
                         description    : String?,
                         mainteiners    : [String]?,
                         repoNames      : [String]?,
                         privacy        : TeamPrivacy?,
                         permission     : TeamPermission?,
                         parentTeamId   : Int?,
                         result         : @escaping ResultTeam) -> Void
    
    func update         (slug           : String,
                         in org         : Int,
                         name           : String,
                         description    : String?,
                         privacy        : TeamPrivacy?,
                         permission     : TeamPermission?,
                         parentTeamId   : Int?,
                         result         : @escaping ResultTeam) -> Void
    
    func delete         (slug           : String,
                         in org         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) -> Void
    
    func childTeams     (slug           : String,
                         in org         : Int,
                         result         : @escaping ResultTeamList) -> Void
    
    func reposOf        (slug           : String,
                         in org         : Int,
                         result         : @escaping RepositoryRepo.ResultLanguageList ) -> Void
    
    func verifyRepo     (owner          : String,
                         repo           : String,
                         managedBy slug : String,
                         in org         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) -> Void
    
    func addOrupdateRepo(owner          : String,
                         repo           : String,
                         managedBy slug : String,
                         in org         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) -> Void
    
    func removeRepo     (owner          : String,
                         repo           : String,
                         managedBy slug : String,
                         in org         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation) -> Void
    
    func authorizedTeams(result         : @escaping ResultTeamList)
    
    func projects       (in slug        : String,
                         org            : Int,
                         result         : @escaping ProjectRepo.ResultProjectList) -> Void
    
    
    
}

public protocol TeamsDiscussionRepo : GHRepository {
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultDiscussion      = (Result< Void   ,Error> ) -> Void
    typealias ResultDiscussionList  = (Result<[Void]  ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func listDiscussions        (in slug    : String,
                                 orgId      : Int,
                                 team_Id    : Int,
                                 result     : @escaping ResultDiscussionList ) -> Void
    
    func single                 (discussionNumber : Int,
                                 in slug    : String,
                                 orgId      : Int,
                                 team_Id    : Int,
                                 result     : @escaping ResultDiscussion ) -> Void
    
    func create                 (title      : Int,
                                 required   : Int,
                                 isPrivate  : Bool,
                                 orgId      : Int,
                                 team_Id    : Int,
                                 result     : @escaping ResultDiscussion ) -> Void
    
    func update                 (discussionNumber : Int,
                                 title      : Int?,
                                 required   : Int?,
                                 isPrivate  : Bool?,
                                 orgId      : Int,
                                 team_Id    : Int,
                                 result     : @escaping ResultDiscussion ) -> Void
    
    func delete                 (discussionNumber : Int,
                                 in slug    : String,
                                 orgId      : Int,
                                 result     : @escaping ResultDiscussion ) -> Void
    
}

public protocol TeamsDiscussionCommentsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultDiscussionComment       = (Result< Void   ,Error> ) -> Void
    typealias ResultDiscussionCommentList   = (Result<[Void]  ,Error> ) -> Void
    
    
    // MARK: TeamsDiscussionRepo
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func listComments   (result: @escaping ResultDiscussionCommentList) -> Void
    
    func single         (commentNumber  : Int,
                         disussionNumber: Int,
                         slug           : String ,
                         org            : String ,
                         result         : @escaping ResultDiscussionComment) -> Void
    
    func create         (body           : String,
                         disussionNumber: Int,
                         slug           : String ,
                         org            : String ,
                         result         : @escaping ResultDiscussionComment) -> Void
    
    func edit           (body           : String,
                         commentNumber  : Int,
                         disussionNumber: Int,
                         slug           : String ,
                         org            : String ,
                         result         : @escaping ResultDiscussionComment) -> Void
    
    
    func delete          (commentNumber  : Int,
                         disussionNumber: Int,
                         slug           : String ,
                         org            : String ,
                         result         : @escaping GHConfiguration.RESTConfirmation) -> Void
    
    
}


public protocol TeamsMembersRepo : GHRepository {
    
    
    // MARK: TeamsDiscussionRepo
    //__________________________________________________________________________________________________________________
    typealias ResultMembership      = (Result< TeamMembershipEntity   ,Error> ) -> Void
    typealias ResultMembershipList  = (Result<[TeamMembershipEntity]  ,Error> ) -> Void
    typealias ResultInvitation      = (Result< TeamInvitationEntity   ,Error> ) -> Void
    typealias ResultInvitationList  = (Result<[TeamInvitationEntity]  ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func listMembers            (orgId          : Int,
                                 teamId         : Int,
                                 role           : TeamRole?,
                                 result         : @escaping UserRepo.ResultUserList ) -> Void
    
    func getMembership          (orgId          : Int,
                                 teamId         : Int,
                                 username       : String,
                                 result         : @escaping ResultMembership) -> Void
    
    func addOrUpdateMembership  (username       : String,
                                 orgId          : Int,
                                 teamId         : Int,
                                 result         : @escaping ResultMembership) -> Void
    
    func removeMembership       (username       : String,
                                 orgId          : Int,
                                 teamId         : Int,
                                 result         : @escaping GHConfiguration.RESTConfirmation ) -> Void
    
    func listPendingInvitations (orgId          : Int,
                                 teamId         : Int,
                                 result         : @escaping ResultInvitationList ) -> Void
    
    
}

public protocol TeamsSynchronizationRepo : GHRepository {
    
    
    // MARK: TeamsDiscussionRepo
    //__________________________________________________________________________________________________________________
    typealias ResultIdP      = (Result< TeamMembershipEntity   ,Error> ) -> Void
    typealias ResultIdPList  = (Result<[TeamMembershipEntity]  ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func listGroups         (in orgId       : Int,
                             result         : @escaping ResultIdPList) -> Void
    
    func listGroups         (for teamId     : Int,
                             result         : @escaping ResultIdPList) -> Void
        
    func createOrUpodate    (for teamId     : Int,
                             result         : @escaping ResultIdP) -> Void
    
}
