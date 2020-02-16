//
//  UserPlanEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/users/


import Foundation

public protocol UserPlanEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var name            : String { get }
    var space           : Int    { get }
    var collaborators   : Int    { get }
    var privateRepos    : Int    { get }    
    
}
