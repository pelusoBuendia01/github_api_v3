//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol CommitUserEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var name    : String    { get }
    var email   : String    { get }
    var date    : Date?     { get }
    
}
