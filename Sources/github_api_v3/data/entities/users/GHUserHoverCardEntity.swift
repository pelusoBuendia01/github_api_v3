//
//  GHUserHoverCardEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/users/

import Foundation

internal class GHUserHoverCardEntity : UserHoverCardEntity {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case context = "context"
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let context : UserHoverCardContextEntity?
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHUserHoverCardEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.context = try container.decode(GHUserHoverCardContextEntity.self  , forKey: .context)}
        catch   { self.context = nil }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }

}
