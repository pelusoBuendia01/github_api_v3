//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol CommitDetailEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var URL             : String                        { get }
    var author          : CommitUserEntity?             { get }
    var commiter        : CommitUserEntity?             { get }
    var message         : String                        { get }
    var tree            : CommitTreeEntity?             { get }
    var verification    : CommitVerificationEntity?     { get }
    
}
