//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol BranchEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var name        : String                        { get }
    var protected   : Bool                          { get }
    var protection  : RequiredStatusChecksEntity?   { get }
    var commit      : CommitEntity?                 { get }
    
}
