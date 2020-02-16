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
    typealias ResultPullRequestCommit               = (Result< PullRequestCommitEntity          ,Error> ) -> Void
    typealias ResultPullRequestCommitList           = (Result<[PullRequestCommitEntity]         ,Error> ) -> Void
    typealias ResultPullRequestReview               = (Result< PullRequestReviewEntity          ,Error> ) -> Void
    typealias ResultPullRequestReviewList           = (Result<[PullRequestReviewEntity]         ,Error> ) -> Void
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
    
}

public protocol PullRequestReviewsRepo : GHRepository {
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
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
