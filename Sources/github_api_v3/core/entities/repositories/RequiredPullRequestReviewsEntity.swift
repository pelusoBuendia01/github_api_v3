//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol RequiredPullRequestReviewsEntity : GHCodable {
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    var dismissalRestrictions           : DismissalRestrictionsEntity?  { get }
    var dismissStaleReviews             : Bool                          { get }
    var requireCodeOwnerReviews         : Bool                          { get }
    var requiredApprovingReviewCount    : Bool                          { get }
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
}
