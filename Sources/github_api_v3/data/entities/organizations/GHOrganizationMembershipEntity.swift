//
//  GHOrganizationMembershipEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/orgs/

import Foundation

class GHOrganizationMembershipEntity: Codable {
            
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
    }
        
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
        
        
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
        
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        //let container = try decoder.container(keyedBy: GHUserEntity.CodingKeys.self)
        
        /// Initialize instance properties
        
    }
        
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    func encode(to encoder: Encoder) throws {
            
    }
    
}
