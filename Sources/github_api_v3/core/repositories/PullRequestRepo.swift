//
//  PullRequestRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com

import Foundation

public protocol PullRequestRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultPullRequest                     = (Result< PullRequestEntity                ,Error> ) -> Void
    typealias ResultPullRequestList                 = (Result<[PullRequestEntity]               ,Error> ) -> Void
    typealias ResultPullRequestFileList             = (Result<[PullRequestFileEntity]           ,Error> ) -> Void
    typealias ResultPullRequestCommit               = (Result< PullRequestCommitEntity          ,Error> ) -> Void
    typealias ResultPullRequestCommitList           = (Result<[PullRequestCommitEntity]         ,Error> ) -> Void
    typealias ResultPullRequestReviewComment        = (Result< PullRequestReviewCommentEntity   ,Error> ) -> Void
    typealias ResultPullRequestReviewCommentList    = (Result<[PullRequestReviewCommentEntity]  ,Error> ) -> Void    
    typealias ResultPullRequestReviewRequest        = (Result< PullRequestReviewRequestEntity   ,Error> ) -> Void
    typealias ResultPullRequestReviewRequestList    = (Result<[PullRequestReviewRequestEntity]  ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    var reviews         : PullRequestReviewsRepo        { get }
    var reviewComments  : PullRequestReviewCommentsRepo { get }
    var reviewRequest   : PullRequestReviewRequestRepo  { get }
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func listPullRequest            (owner      : String,
                                     repo       : String,
                                     state      : PullRequestState?,
                                     head       : String?,
                                     base       : String?,
                                     sort       : PullRequestSort?,
                                     direction  : PullRequestDirection?,
                                     result     : @escaping ResultPullRequestList) -> Void
    
    
    func single                     (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     result     : @escaping ResultPullRequest) -> Void
    
    
    func create                     (owner      : String,
                                     repo       : String,
                                     title      : String,
                                     head       : String,
                                     base       : String,
                                     body       : String?,
                                     mainteinerCanModify : Bool?,
                                     draft      : Bool?,
                                     result     : @escaping ResultPullRequest) -> Void
    
    func update                     (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     title      : String?,
                                     body       : String?,
                                     state      : PullRequestState?,
                                     base       : String?,
                                     mainteinerCanModify : Bool?,
                                     result     : @escaping ResultPullRequest) -> Void
    
        
    func filesIn                    (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     result     : @escaping ResultPullRequestFileList) -> Void
    
    func verifyMerged               (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     result     : @escaping GHConfiguration.RESTConfirmation) -> Void
    
    func merge                      (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     title      : String,
                                     message    : String,
                                     sha        : String,
                                     method     : PullRequestCommitEntity?,
                                     result     : @escaping GHConfiguration.RESTConfirmation) -> Void
    
}

public protocol PullRequestReviewsRepo : GHRepository {
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultPullRequestReview               = (Result< PullRequestReviewEntity          ,Error> ) -> Void
    typealias ResultPullRequestReviewList           = (Result<[PullRequestReviewEntity]         ,Error> ) -> Void
    typealias ResultPullRequestReviewComment        = (Result< PullRequestReviewCommentEntity   ,Error> ) -> Void
    typealias ResultPullRequestReviewCommentList    = (Result<[PullRequestReviewCommentEntity]  ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func listReview                 (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     result     : @escaping ResultPullRequestReviewList ) -> Void
        
    func single                     (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     result     : @escaping ResultPullRequestReview ) -> Void
        
    func deletePending              (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     result     : @escaping PullRequestRepo.ResultPullRequest ) -> Void

    func comment                    (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     result     : @escaping ResultPullRequestReview ) -> Void
    
    func create                     (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     body       : String,
                                     result     : @escaping ResultPullRequestReview ) -> Void
    
    func update                     (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     reviewId   : Int,
                                     body       : String,
                                     result     : @escaping ResultPullRequestReview ) -> Void
    
    
    func submit                     (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     reviewId   : Int,
                                     body       : String,
                                     event      : PullRequestReviewEvent,
                                     result     : @escaping ResultPullRequestReview ) -> Void
    
    func dismiss                    (owner      : String,
                                     repo       : String,
                                     pullNumber : Int,
                                     reviewId   : Int,
                                     message    : String,
                                     result     : @escaping ResultPullRequestReview ) -> Void
    
    
}

public protocol PullRequestReviewCommentsRepo : GHRepository {
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
}

public protocol PullRequestReviewRequestRepo : GHRepository {
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
}
