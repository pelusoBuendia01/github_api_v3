//
//  ProjectEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/projects/

import Foundation

public  protocol ProjectEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var id                  : Int           { get }
    var ownerURL            : String        { get }
    var URL                 : String        { get }
    var htmlURL             : String        { get }
    var columnsURL          : String        { get }
    var nodeId              : String        { get }
    var name                : String        { get }
    var body                : String        { get }
    var number              : Int           { get }
    var state               : String        { get }
    var creator             : UserEntity?   { get }
    var createdAt           : Date?         { get }
    var updatedAt           : Date?         { get }
    
}
