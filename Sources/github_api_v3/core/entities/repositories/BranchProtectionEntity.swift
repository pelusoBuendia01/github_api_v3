//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol BranchProtectionEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var enabled              : Bool     { get }
    var requiredStatusChecks : Bool     { get }
    
    
}
