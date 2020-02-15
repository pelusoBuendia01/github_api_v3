//
//  ProjectEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

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
