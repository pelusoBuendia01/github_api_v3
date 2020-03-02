//
//  File.swift
//  
//
//  Created by Francisco Romero on 28/02/20.
//

import Foundation

public enum PullRequestReviewEvent : String {    
    case approve        = "APPROVE"
    case requestChanges = "REQUEST_CHANGES"
    case comment        = "COMMENT"
    case pending        = "PENDING"
}
