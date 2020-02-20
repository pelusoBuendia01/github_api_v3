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
    var key             : String    { get }
    var name            : String    { get }
    var nodeId          : String    { get }
    var spdxId          : String    { get }
    var url             : String    { get }
    var htmlURL         : String?   { get }
    var description     : String?   { get }
    var implementation  : String?   { get }
    var permissions     : [String]? { get }
    var conditions      : [String]? { get }
    var limitations     : [String]? { get }
    var body            : String?   { get }
    var featured        : Bool?     { get }
    
}
