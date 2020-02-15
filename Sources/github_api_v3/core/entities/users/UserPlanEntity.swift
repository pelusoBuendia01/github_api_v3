//
//  UserPlanEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol UserPlanEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var name            : String { get }
    var space           : Int    { get }
    var collaborators   : Int    { get }
    var privateRepos    : Int    { get }    
    
}
