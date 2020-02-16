//
//  UserEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/users/


import Foundation

public protocol UserEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var id                  : Int               { get }
    var login               : String            { get }
    var nodeId              : String            { get }
    var avatarURL           : String            { get }
    var gravatarID          : String            { get }
    var url                 : String            { get }
    var htmlURL             : String            { get }
    var followersURL        : String            { get }
    var followingURL        : String            { get }
    var gistsURL            : String            { get }
    var starredURL          : String            { get }
    var subscriptionsURL    : String            { get }
    var organizations_url   : String            { get }
    var reposURL            : String            { get }
    var eventsURL           : String            { get }
    var receivedEventsURL   : String            { get }
    var type                : String            { get }
    var siteAdmin           : Bool              { get }
    var name                : String?           { get }
    var company             : String?           { get }
    var blog                : String?           { get }
    var location            : String?           { get }
    var email               : String?           { get }
    var hireable            : Bool?             { get }
    var bio                 : String?           { get }
    var publicRepos         : Int?              { get }
    var publicGists         : Int?              { get }
    var followers           : Int?              { get }
    var following           : Int?              { get }
    var createdAt           : Date?             { get }
    var updatedAt           : Date?             { get }
    var plan                : UserPlanEntity?   { get }
    var contributions       : Int?              { get }
    
}
