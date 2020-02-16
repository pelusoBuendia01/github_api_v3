//
//  GHOrganizationAuthorizationEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/orgs/

import Foundation

class GHOrganizationAuthorizationEntity: Codable {

    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    
    enum CodingKeys: String, CodingKey {
        case login                  = "login"
        case credentialId           = "credential_id"
        case credentialType         = "credential_type"
        case tokenLastEight         = "token_last_eight"
        case credentialAuthorizedAt = "credential_authorized_at"
        case scopes                 = "scopes"
    }
    
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    let login                   : String
    let credentialId            : String
    let credentialType          : String
    let tokenLastEight          : String
    let credentialAuthorizedAt  : Date?
    let scopes                  : [String]
        
        
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
        
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHOrganizationAuthorizationEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.login = try container.decode(String.self, forKey: .login) }
        catch   { self.login = "" }
        
        do      { self.credentialId = try container.decode(String.self, forKey: .credentialId)}
        catch   { self.credentialId = "" }
        
        do      { self.credentialType = try container.decode(String.self, forKey: .credentialType)}
        catch   { self.credentialType = "" }
        
        do      { self.tokenLastEight = try container.decode(String.self, forKey: .tokenLastEight)}
        catch   { self.tokenLastEight = "" }
        
        do      { self.credentialAuthorizedAt = try container.decode(Date.self, forKey: .login)}
        catch   { self.credentialAuthorizedAt = nil }
        
        do      { self.scopes = try container.decode([String].self, forKey: .login)}
        catch   { self.scopes = [] }
        
    }
        
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    func encode(to encoder: Encoder) throws {
        
    }
}
