//
//  OrganizationAuthorizationEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/orgs/

import Foundation

public protocol OrganizationAuthorizationEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var login                   : String    { get }
    var credentialId            : String    { get }
    var credentialType          : String    { get }
    var tokenLastEight          : String    { get }
    var credentialAuthorizedAt  : Date?     { get }
    var scopes                  : [String]  { get }
 
}
