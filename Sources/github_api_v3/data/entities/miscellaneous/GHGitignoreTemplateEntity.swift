//
//  GHGitignoreTemplateEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation


class GHGitignoreTemplateEntity : GitignoreTemplateEntity {
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case source = "source"
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    let name    : String
    let source  : String
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHGitignoreTemplateEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.name = try container.decode(String.self, forKey: .name)}
        catch   { self.name = ""}
        
        do      { self.source = try container.decode(String.self, forKey: .source)}
        catch   { self.source = ""}
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
