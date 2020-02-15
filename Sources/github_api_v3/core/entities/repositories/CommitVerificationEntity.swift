//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol CommitVerificationEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var verified    : Bool                      { get }
    var reason      : CommitVerificationReason? { get }
    var signature   : String?                   { get }
    var payload     : String?                   { get }
    
}
