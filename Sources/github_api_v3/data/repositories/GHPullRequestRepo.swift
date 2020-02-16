//
//  File.swift
//  
//
//  Created by Francisco Romero on 15/02/20.
//

import Foundation

internal class GHPullRequestRepo: PullRequestRepo {
    
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    
    public var session  : GHSession
    let reviews         : PullRequestReviewsRepo
    let reviewComments  : PullRequestReviewCommentsRepo
    let reviewRequest   : PullRequestReviewRequestRepo
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        
        /// initializa instance variables
        self.session = session
        
        self.reviews        = GHPullRequestReviewsRepo          (session:self.session)
        self.reviewComments = GHPullRequestReviewCommentsRepo   (session:self.session)
        self.reviewRequest  = GHPullRequestReviewRequestRepo    (session:self.session)
        
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________
    
    
}

internal class GHPullRequestReviewsRepo: PullRequestReviewsRepo {
    
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


internal class GHPullRequestReviewCommentsRepo: PullRequestReviewCommentsRepo {
    
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


internal class GHPullRequestReviewRequestRepo: PullRequestReviewRequestRepo {
    
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
