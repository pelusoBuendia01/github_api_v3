//
//  ProjectCardEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol ProjectCardEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var id          : Int           { get }
    var nodeId      : String        { get }
    var note        : String        { get }
    var creator     : UserEntity?   { get }
    var createdAt   : Date?         { get }
    var updatedAt   : Date?         { get }
    var archived    : Bool          { get }
    var columnURL   : String        { get }
    var contentURL  : String        { get }
    var projectURL  : String        { get }

    
}
