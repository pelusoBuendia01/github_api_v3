//
//  OrganizationEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol OrganizationEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var id                                      : Int       {get}
    var login                                   : String    {get}
    var name                                    : String?   {get}
    var nodeID                                  : String    {get}
    var URL                                     : String    {get}
    var reposURL                                : String    {get}
    var eventsURL                               : String    {get}
    var hooksURL                                : String    {get}
    var issuesURL                               : String    {get}
    var membersURL                              : String    {get}
    var publicMembersURL                        : String    {get}
    var avatarURL                               : String    {get}
    var description                             : String    {get}
    var followers                               : Int?      {get}
    var following                               : Int?      {get}
    var company                                 : String?   {get}
    var blog                                    : String?   {get}
    var location                                : String?   {get}
    var email                                   : String?   {get}
    var isVerified                              : Bool?     {get}
    var hasOrganizationProjects                 : Bool?     {get}
    var hasRepositoryProjects                   : Bool?     {get}
    var publicRepos                             : Int?      {get}
    var publicGists                             : Int?      {get}
    var htmlURL                                 : String?   {get}
    var createdAt                               : Date?     {get}
    //var type                                    : {get}
    var totalPrivateRepos                       : Int?      {get}
    var ownedPrivateRepos                       : Int?      {get}
    var privateGists                            : Int?      {get}
    var diskUsage                               : Int?      {get}
    var collaborators                           : Int?      {get}
    var billingEmail                            : String?   {get}
    //var defaultRepositoryPermission             : {get}
    var membersCanCreateRepositories            : Bool?     {get}
    var twoFactorRequirementEnabled             : Bool?     {get}
    //var membersAllowedRepositoryCreationType    : {get}
    var membersCanCreatePublicRepositories      : Bool?     {get}
    var membersCanCreatePrivateRepositories     : Bool?     {get}
    var membersCanCreateInternalRepositories    : Bool?     {get}
    
}
