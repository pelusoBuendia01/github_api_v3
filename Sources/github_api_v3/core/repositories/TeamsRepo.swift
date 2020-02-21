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
