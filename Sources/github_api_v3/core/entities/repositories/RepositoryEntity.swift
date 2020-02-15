//
//  RepositoryEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol RepositoryEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var id              : Int                               { get }
        var name            : String                        { get }
        var owner           : UserEntity?                   { get }
        var nodeId          : String                        { get }
        var isPrivate       : Bool                          { get }
        var archived        : Bool?                         { get }
        var createdAt       : Date?                         { get }
        var defaultBranch   : String?                       { get }
        var description     : String                        { get }
        var disabled        : Bool?                         { get }
        var fork            : Int                           { get }
        var forks           : Int                           { get }
        var forksCount      : Int                           { get }
        var fullName        : String?                       { get }
        var hasDownloads    : Bool?                         { get }
        var hasIssues       : Bool?                         { get }
        var hasPages        : Bool?                         { get }
        var hasProjects     : Bool?                         { get }
        var hasWiki         : Bool?                         { get }
        var homepage        : String                        { get }
        var isTemplate      : Bool?                         { get }
        var language        : String?                       { get }
        var license         : LicenseEntity?                { get }
        var openIssues      : Int                           { get }
        var openIssuesCount : Int                           { get }
        var permissions     : RepositoryPermisionEntity?    { get }
        var pushedAt        : Date?                         { get }
        var size            : Int                           { get }
        var stargazersCount : Int                           { get }
        var topics          : [String]                      { get }
        var updatedAt       : Date?                         { get }
        var URL             : String                        { get }
        var visibility      : RepositoryVisibility          { get }
        var watchers        : Int                           { get }
        var watchersCount   : Int                           { get }
    
}
