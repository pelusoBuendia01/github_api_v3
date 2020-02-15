//
//  PullRequestRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

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
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}
