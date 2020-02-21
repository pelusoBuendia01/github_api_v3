//
//  GHMetaEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation

class GHMetaEntity: MetaEntity {

    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    
    enum CodingKeys: String, CodingKey {
        case verifiablePasswordAuthentication   = "verifiable_password_authentication"
        case sshKeyFingerprints                 = "ssh_key_fingerprints"
        case hooks                              = "hooks"
        case web                                = "web"
        case api                                = "api"
        case git                                = "git"
        case pages                              = "pages"
        case importer                           = "importer"
    }

    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    let verifiablePasswordAuthentication    : Bool
    let sshKeyFingerprints                  : SshKeyFingerprints?
    let hooks                               : [String]
    let web                                 : [String]
    let api                                 : [String]
    let git                                 : [String]
    let pages                               : [String]
    let importer                            : [String]
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHMetaEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.verifiablePasswordAuthentication = try container.decode(Bool.self, forKey: .verifiablePasswordAuthentication)}
        catch   { self.verifiablePasswordAuthentication = false }
        
        do      { self.sshKeyFingerprints = try container.decode(GHSshKeyFingerprints.self, forKey: .sshKeyFingerprints)}
        catch   { self.sshKeyFingerprints = nil }
        
        
        do      { self.hooks = try container.decode([String].self, forKey: .hooks)}
        catch   { self.hooks = [] }
        
        do      { self.web = try container.decode([String].self, forKey: .web)}
        catch   { self.web = [] }
        
        do      { self.api = try container.decode([String].self, forKey: .api)}
        catch   { self.api = [] }
        
        do      { self.git = try container.decode([String].self, forKey: .git)}
        catch   { self.git = [] }
        
        do      { self.pages = try container.decode([String].self, forKey: .pages)}
        catch   { self.pages = [] }
        
        do      { self.importer = try container.decode([String].self, forKey: .importer)}
        catch   { self.importer = [] }
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
