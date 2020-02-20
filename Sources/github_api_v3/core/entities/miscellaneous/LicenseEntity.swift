//
//  LicenseEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation

public protocol LicenseEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var key     : String { get }
    var name    : String { get }
    var nodeId  : String { get }
    var spdxId  : String { get }
    var url     : String { get }
    
}
