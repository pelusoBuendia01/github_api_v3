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
    
    func listPullRequest        (owner      : String,
                                 repo       : String,
                                 state      : PullRequestState?,
                                 head       : String?,
                                 base       : String?,
                                 sort       : PullRequestSort?,
                                 direction  : PullRequestDirection?,
                                 result     : @escaping ResultPullRequestList) {
            result(.failure(GHSession.SessionError.notImplemented(message: "GHPullRequestRepo.listPullRequest : 🚧 not implemented")))
    }
    
    
    func single                 (owner      : String,
                                 repo       : String,
                                 pullNumber : Int,
                                 result     : @escaping ResultPullRequest) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHPullRequestRepo.single : 🚧 not implemented")))
    }
    
    func create                 (owner      : String,
                                 repo       : String,
                                 title      : String,
                                 head       : String,
                                 base       : String,
                                 body       : String?,
                                 mainteinerCanModify: Bool?,
                                 draft      : Bool?,
                                 result     : @escaping ResultPullRequest) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHPullRequestRepo.create : 🚧 not implemented")))
    }
    
    func update                 (owner      : String,
                                 repo       : String,
                                 pullNumber : Int,
                                 title      : String?,
                                 body       : String?,
                                 state      : PullRequestState?,
                                 base       : String?,
                                 mainteinerCanModify: Bool?,
                                 result     : @escaping ResultPullRequest) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHPullRequestRepo.update : 🚧 not implemented")))
    }
    
    func filesIn                (owner      : String,
                                 repo       : String,
                                 pullNumber : Int,
                                 result     : @escaping ResultPullRequestFileList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHPullRequestRepo.filesIn : 🚧 not implemented")))
    }
    
    func verifyMerged           (owner      : String,
                                 repo       : String,
                                 pullNumber : Int,
                                 result     : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHPullRequestRepo.verifyMerged : 🚧 not implemented")))
    }
    
    func merge                  (owner      : String,
                                 repo       : String,
                                 pullNumber : Int,
                                 title      : String,
                                 message    : String,
                                 sha        : String,
                                 method     : PullRequestCommitEntity?,
                                 result     : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHPullRequestRepo.merge : 🚧 not implemented")))
    }
    

    
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
