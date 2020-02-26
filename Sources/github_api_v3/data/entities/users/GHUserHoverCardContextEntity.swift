//
//  GHUserHoverCardContextEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/users/

import Foundation

internal class GHUserHoverCardContextEntity: UserHoverCardContextEntity {
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case message    = "message"
        case octicon    = "octicon"
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let message : String
    let octicon : String
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHUserHoverCardContextEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.message = try container.decode(String.self  , forKey: .message)}
        catch   { self.message = "" }
        
        do      { self.octicon = try container.decode(String.self  , forKey: .octicon)}
        catch   { self.octicon = "" }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
