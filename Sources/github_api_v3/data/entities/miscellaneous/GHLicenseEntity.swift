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
        case key            = "key"
        case name           = "name"
        case nodeId         = "node_id"
        case spdxId         = "spdx_id"
        case url            = "url"
        case htmlURL        = "html_url"
        case description    = "description"
        case implementation = "implementation"
        case permissions    = "permissions"
        case conditions     = "conditions"
        case limitations    = "limitations"
        case body           = "body"
        case featured       = "featured"
    }
    
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    let key             : String
    let name            : String
    let nodeId          : String
    let spdxId          : String
    let url             : String
    var htmlURL         : String?
    var description     : String?
    var implementation  : String?
    var permissions     : [String]?
    var conditions      : [String]?
    var limitations     : [String]?
    var body            : String?
    var featured        : Bool?
    
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
        
        do      { self.htmlURL = try container.decode(String.self, forKey: .htmlURL) }
        catch   { self.htmlURL = nil }
        
        do      { self.description = try container.decode(String.self, forKey: .description) }
        catch   { self.description = nil }
        
        do      { self.implementation = try container.decode(String.self, forKey: .implementation) }
        catch   { self.implementation = nil }
        
        do      { self.permissions = try container.decode([String].self, forKey: .permissions) }
        catch   { self.permissions = nil }
        
        do      { self.conditions = try container.decode([String].self, forKey: .conditions) }
        catch   { self.conditions = nil }
        
        do      { self.limitations = try container.decode([String].self, forKey: .limitations) }
        catch   { self.limitations = nil }
        
        do      { self.body = try container.decode(String.self, forKey: .body) }
        catch   { self.body = nil }
        
        do      { self.featured = try container.decode( Bool.self, forKey: .featured) }
        catch   { self.featured = nil }
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
