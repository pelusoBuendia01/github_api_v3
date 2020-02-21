//
//  SshKeyFingerprints.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation


public protocol SshKeyFingerprints: GHCodable {
 
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var md5RSA      : String {get}
    var md5DSA      : String {get}
    var sha256RSA   : String {get}
    var sha256DSA   : String {get}
    
}
