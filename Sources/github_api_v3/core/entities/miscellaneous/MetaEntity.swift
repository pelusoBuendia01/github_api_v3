//
//  MetaEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation

public protocol MetaEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var verifiablePasswordAuthentication    : Bool                { get }
    var sshKeyFingerprints                  : SshKeyFingerprints?   { get }
    var hooks                               : [String]              { get }
    var web                                 : [String]              { get }
    var api                                 : [String]              { get }
    var git                                 : [String]              { get }
    var pages                               : [String]              { get }
    var importer                            : [String]              { get }
    
}
