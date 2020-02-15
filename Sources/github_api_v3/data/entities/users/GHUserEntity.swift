//
//  GHUser.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 11/01/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//  TECH REFERENCE : https://developer.github.com/v3/users/
//

import Foundation

struct GHUserEntity : UserEntity  {
        
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
        case id
        case login
        case node_id
        case avatar_url
        case gravatar_id
        case url
        case html_url
        case followers_url
        case following_url
        case gists_url
        case starred_url
        case subscriptions_url
        case organizations_url
        case repos_url
        case events_url
        case received_events_url
        case type
        case site_admin
        case name
        case company
        case blog
        case location
        case email
        case hireable
        case bio
        case public_repos
        case public_gists
        case followers
        case following
        case created_at
        case updated_at
        case plan
        case contributions
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let id                  : Int
    let login               : String
    let nodeId              : String
    let avatarURL           : String
    let gravatarID          : String
    let url                 : String
    let htmlURL             : String
    let followersURL        : String
    let followingURL        : String
    let gistsURL            : String
    let starredURL          : String
    let subscriptionsURL    : String
    let organizations_url   : String
    let reposURL            : String
    let eventsURL           : String
    let receivedEventsURL   : String
    let type                : String
    let siteAdmin           : Bool
    let name                : String?
    let company             : String?
    let blog                : String?
    let location            : String?
    let email               : String?
    let hireable            : Bool?
    let bio                 : String?
    let publicRepos         : Int?
    let publicGists         : Int?
    let followers           : Int?
    let following           : Int?
    let createdAt           : Date?
    let updatedAt           : Date?
    let plan                : UserPlanEntity?
    let contributions       : Int?
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHUserEntity.CodingKeys.self)
        
        /// Initialize instance properties
        id                  = try container.decode(Int.self     , forKey: .id)
        login               = try container.decode(String.self  , forKey: .login)
        nodeId              = try container.decode(String.self  , forKey: .node_id)
        avatarURL           = try container.decode(String.self  , forKey: .avatar_url)
        gravatarID          = try container.decode(String.self  , forKey: .gravatar_id)
        url                 = try container.decode(String.self  , forKey: .url)
        htmlURL             = try container.decode(String.self  , forKey: .html_url)
        followersURL        = try container.decode(String.self  , forKey: .followers_url)
        followingURL        = try container.decode(String.self  , forKey: .following_url)
        gistsURL            = try container.decode(String.self  , forKey: .gists_url)
        starredURL          = try container.decode(String.self  , forKey: .starred_url)
        subscriptionsURL    = try container.decode(String.self  , forKey: .subscriptions_url)
        organizations_url   = try container.decode(String.self  , forKey: .organizations_url)
        reposURL            = try container.decode(String.self  , forKey: .repos_url)
        eventsURL           = try container.decode(String.self  , forKey: .events_url)
        receivedEventsURL   = try container.decode(String.self  , forKey: .received_events_url)
        type                = try container.decode(String.self  , forKey: .type)
        siteAdmin           = try container.decode(Bool.self    , forKey: .site_admin)
        do {
            name            = try container.decode(String.self  , forKey: .name)
        }
        catch {
            name            = nil
        }
        do {
            company         = try container.decode(String.self  , forKey: .company)
        }
        catch {
            company         = nil
        }
        do {
            blog            = try container.decode(String.self  , forKey: .blog)
        }
        catch {
            blog            = nil
        }
        do {
            location        = try container.decode(String.self  , forKey: .location)
        }
        catch {
            location        = nil
        }
        do {
            email           = try container.decode(String.self  , forKey: .email)
        }
        catch {
            email           = nil
        }
        do {
            hireable        = try container.decode(Bool.self    , forKey: .hireable)
        }
        catch {
            hireable        = nil
        }
        do {
            bio             = try container.decode(String.self  , forKey: .bio)
        }
        catch {
            bio             = nil
        }
        
        if (container.allKeys.contains(.public_repos)) {
            publicRepos         = try container.decode(Int.self     , forKey: .public_repos)
        }
        else{
            publicRepos            = nil
        }
        if (container.allKeys.contains(.public_gists)) {
            publicGists         = try container.decode(Int.self     , forKey: .public_gists)
        }
        else{
            publicGists         = nil
            
        }
        if (container.allKeys.contains(.followers)) {
            followers           = try container.decode(Int.self     , forKey: .followers)
        } else {
            followers           = nil
        }
        if (container.allKeys.contains(.following)) {
            following           = try container.decode(Int.self     , forKey: .following)
        }
        else {
            following           = nil
        }
        
        if (container.allKeys.contains(.created_at)) {
            createdAt           = try container.decode(Date.self    , forKey: .created_at)
        } else {
            createdAt           = nil
        }
        
        if (container.allKeys.contains(.updated_at)) {
            updatedAt           = try container.decode(Date.self    , forKey: .updated_at)
        } else {
            updatedAt           = nil
        }
        
        
        if (container.allKeys.contains(.plan)) {
            plan            = try container.decode(GHUserPlanEntity.self    , forKey: .plan)
        }
        else{
            plan            = nil
        }
        
        if (container.allKeys.contains(.contributions)) {
            contributions   = try container.decode(Int.self    , forKey: .contributions)
        }
        else{
            contributions   = nil
        }
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }

}
