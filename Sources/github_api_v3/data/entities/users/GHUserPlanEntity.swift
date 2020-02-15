//
//  GHUserPlan.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 11/01/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//  TECH REFERENCE : https://developer.github.com/v3/users/
//

import Foundation

struct GHUserPlanEntity : UserPlanEntity {
        
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
        case name
        case space
        case collaborators
        case private_repos
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let name            : String
    let space           : Int
    let collaborators   : Int
    let privateRepos    : Int
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHUserPlanEntity.CodingKeys.self)
        
        self.name           = try container.decode(String.self  , forKey: .name)
        self.space          = try container.decode(Int.self     , forKey: .space)
        self.collaborators  = try container.decode(Int.self     , forKey: .collaborators)
        self.privateRepos   = try container.decode(Int.self     , forKey: .private_repos)
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
