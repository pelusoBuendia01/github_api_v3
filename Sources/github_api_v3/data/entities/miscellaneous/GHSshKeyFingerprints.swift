//
//  GHSshKeyFingerprints.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation


class GHSshKeyFingerprints: SshKeyFingerprints {
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case md5RSA     = "MD5_RSA"
        case md5DSA     = "MD5_DSA"
        case sha256RSA  = "SHA256_RSA"
        case sha256DSA  = "SHA256_DSA"
            
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    let md5RSA      : String
    let md5DSA      : String
    let sha256RSA   : String
    let sha256DSA   : String
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHSshKeyFingerprints.CodingKeys.self)
        
        /// Initialize instance properties
        
        do      { self.md5RSA = try container.decode(String.self, forKey: .md5RSA) }
        catch   { self.md5RSA = "" }
        
        do      { self.md5DSA = try container.decode(String.self, forKey: .md5DSA) }
        catch   { self.md5DSA = "" }
        
        do      { self.sha256RSA = try container.decode(String.self, forKey: .sha256RSA) }
        catch   { self.sha256RSA = "" }
        
        do      { self.sha256DSA = try container.decode(String.self, forKey: .sha256DSA) }
        catch   { self.sha256DSA = "" }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
}
