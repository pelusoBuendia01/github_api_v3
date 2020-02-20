//
//  GHLicenseEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation

class GHLicenseEntity: LicenseEntity {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey  {
        case key        = "key"
        case name       = "name"
        case nodeId     = "node_id"
        case spdxId     = "spdx_id"
        case url        = "url"
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let key     : String
    let name    : String
    let nodeId  : String
    let spdxId  : String
    let url     : String
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHLicenseEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.key = try container.decode(String.self, forKey: .key) }
        catch   { self.key = "" }
        
        do      { self.name = try container.decode(String.self, forKey: .name) }
        catch   { self.name = "" }
        
        do      { self.nodeId = try container.decode(String.self, forKey: .nodeId) }
        catch   { self.nodeId = "" }
        
        do      { self.spdxId = try container.decode(String.self, forKey: .spdxId) }
        catch   { self.spdxId = "" }
        
        do      { self.url = try container.decode(String.self, forKey: .url) }
        catch   { self.url = "" }
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
