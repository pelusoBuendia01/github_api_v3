//
//  File.swift
//  
//
//  Created by Francisco Romero on 28/02/20.
//

import Foundation

public enum PullRequerstLinkRelation : String {
    case isSelf         = "self"
    case html           = "html"
    case issue          = "issue"
    case comments       = "comments"
    case reviewComments = "review_comments"
    case reviewComment  = "review_comment"
    case commits        = "commits"
    case statuses       = "statuses"
    
}
