//
//  OrganizationEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/orgs/

import Foundation

public protocol OrganizationEntity: GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var id                                      : Int       {get}
    var login                                   : String    {get}
    var name                                    : String?   {get}
    var nodeID                                  : String    {get}
    var URL                                     : String    {get}
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
    var type                                    : String    {get}
    var totalPrivateRepos                       : Int?      {get}
    var ownedPrivateRepos                       : Int?      {get}
    var privateGists                            : Int?      {get}
    var diskUsage                               : Int?      {get}
    var collaborators                           : Int?      {get}
    var billingEmail                            : String?   {get}
    var defaultRepositoryPermission             : OrganizationRepositoryPermission? {get}
    var membersCanCreateRepositories            : Bool?     {get}
    var twoFactorRequirementEnabled             : Bool?     {get}
    var membersAllowedRepositoryCreationType    : OrganizationMembersAllowedRepositoryCreationType? {get}
    var membersCanCreatePublicRepositories      : Bool?     {get}
    var membersCanCreatePrivateRepositories     : Bool?     {get}
    var membersCanCreateInternalRepositories    : Bool?     {get}    
    var reposURL                                : String    {get}
    var eventsURL                               : String    {get}
    var hooksURL                                : String    {get}
    var issuesURL                               : String    {get}
    var membersURL                              : String    {get}
    var publicMembersURL                        : String    {get}
    var avatarURL                               : String    {get}
    
}
