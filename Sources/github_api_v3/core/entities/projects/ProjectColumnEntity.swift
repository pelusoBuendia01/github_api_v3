//
//  ProjectColumnEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol ProjectColumnEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var id          : Int       { get }
    var name        : String    { get }
    var URL         : String    { get }
    var projectURL  : String    { get }
    var cardsURL    : String    { get }
    var nodeId      : String    { get }
    var createdAt   : Date?     { get }
    var updatedAt   : Date?     { get }
    
}
