//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public protocol CommitEntity : GHCodable {
 
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var URL         : String                { get }
    var sha         : String                { get }
    var nodeId      : String?               { get }
    var htmlURL     : String?               { get }
    var commentsURS : String?               { get }
    var commit      : CommitDetailEntity?   { get }
    var author      : UserEntity?           { get }
    var commiter    : UserEntity?           { get }
    var parents     : [CommitTreeEntity]    { get }
    var stats       : CommitStatsEntity?    { get }
    var files       : [CommitFileEntity]    { get }
    
}
