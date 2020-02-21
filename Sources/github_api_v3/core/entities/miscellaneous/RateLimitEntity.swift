//
//  RateLimitEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation

public protocol RateLimitEntity: GHCodable {
    
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    var resources           : RateLimitResurcesEntity?  { get }
    var rate                : RateLimitItemEntity?      { get }
    
    
}


public protocol RateLimitResurcesEntity: GHCodable {
    
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    var core                : RateLimitItemEntity? { get }
    var search              : RateLimitItemEntity? { get }
    var graphql             : RateLimitItemEntity? { get }
    var integrationManifest : RateLimitItemEntity? { get }
 
    
}

public protocol RateLimitItemEntity: GHCodable {
    
 
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    var limit               : Int { get }
    var remaining           : Int { get }
    var reset               : Int { get }
    
    
}


