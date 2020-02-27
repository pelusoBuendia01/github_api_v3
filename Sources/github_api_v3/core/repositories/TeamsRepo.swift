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
    
    var discussion          : TeamsDiscussionCommentsRepo   { get }
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
                         result         : @escaping GHConfiguration.RESTConfirmation)
    
    func addOrupdateRepo(owner          : String,
                         repo           : String,
                         managedBy slug : String,
                         in org         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation)
    
    func removeRepo     (owner          : String,
                         repo           : String,
                         managedBy slug : String,
                         in org         : Int,
                         result         : @escaping GHConfiguration.RESTConfirmation)
    
    func authorizedTeams(result         : @escaping ResultTeamList)
    
    func projects       (in slug        : String,
                         org            : Int,
                         result         : @escaping ProjectRepo.ResultProjectList)
    
    
    
}

public protocol TeamsDiscussionRepo : GHRepository {
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
}

public protocol TeamsDiscussionCommentsRepo : GHRepository {
    
    
    // MARK: TeamsDiscussionRepo
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
}


public protocol TeamsMembersRepo : GHRepository {
    
    
    // MARK: TeamsDiscussionRepo
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
}

public protocol TeamsSynchronizationRepo : GHRepository {
    
    
    // MARK: TeamsDiscussionRepo
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
}
