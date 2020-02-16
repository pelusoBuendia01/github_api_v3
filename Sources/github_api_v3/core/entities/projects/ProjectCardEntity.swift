//
//  ProjectCardEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/projects/

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
