//
//  GHUserPlanEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/users/

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
        
        /// Initialize instance properties
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
