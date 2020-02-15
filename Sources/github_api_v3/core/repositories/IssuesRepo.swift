//
//  IssuesRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol IssuesRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultIssue                       = (Result<IssueEntity               ,Error> ) -> Void
    typealias ResultIssueList                   = (Result<[IssueEntity]             ,Error> ) -> Void
    
    typealias ResultIssueComment                = (Result<IssueCommentEntity        ,Error> ) -> Void
    typealias ResultIssueCommentList            = (Result<[IssueCommentEntity]      ,Error> ) -> Void
    
    typealias ResultIssueEventComment           = (Result<IssueEventEntity          ,Error> ) -> Void
    typealias ResultIssueEventCommentList       = (Result<[IssueEventEntity]        ,Error> ) -> Void
    
    typealias ResultIssueLabelComment           = (Result<IssueLabelEntity          ,Error> ) -> Void
    typealias ResultIssueLabelCommentList       = (Result<[IssueLabelEntity]        ,Error> ) -> Void
    
    typealias ResultIssueMilestoneComment       = (Result<IssueMilestoneEntity      ,Error> ) -> Void
    typealias ResultIssueMilestoneCommentList   = (Result<[IssueMilestoneEntity]    ,Error> ) -> Void
    
    typealias ResultIssueTimelineComment        = (Result<IssueTimelineEntity       ,Error> ) -> Void
    typealias ResultIssueTimelineCommentList    = (Result<[IssueTimelineEntity]     ,Error> ) -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}
