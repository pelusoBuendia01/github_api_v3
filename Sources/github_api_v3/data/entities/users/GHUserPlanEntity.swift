//
//  GHUserPlanEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/users/

import Foundation

internal class GHUserPlanEntity : UserPlanEntity {
        
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
    
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHUserPlanEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.name = try container.decode(String.self, forKey: .name) }
        catch   { self.name = "" }
        
        do      { self.space = try container.decode(Int.self, forKey: .space)}
        catch   { self.space = 0 }
        
        do      { self.collaborators = try container.decode(Int.self, forKey: .collaborators) }
        catch   { self.collaborators = 0 }
        
        do      { self.privateRepos = try container.decode(Int.self, forKey: .private_repos) }
        catch   { self.privateRepos = 0 }        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
