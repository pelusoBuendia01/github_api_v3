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
