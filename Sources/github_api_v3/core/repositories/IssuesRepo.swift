//
//  IssuesRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com

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
