//
//  ProjectColumnEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/projects/

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
