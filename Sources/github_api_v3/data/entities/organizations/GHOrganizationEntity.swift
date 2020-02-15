//
//  GHOrganizationEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

class GHOrganizationEntity: OrganizationEntity {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
        case id
        case login
        case name
        case node_id
        case url
        case hooks_url
        case issues_url
        case members_url
        case public_members_url
        
        case followers
        case following
        case repos_url
        case events_url
        case avatar_url
        case description
        case company
        case blog
        case location
        case email
        case is_verified
        case has_organization_projects
        case has_repository_projects
        case public_repos
        case public_gists
        case html_url
        case created_at
        case type
        case total_private_repos
        case owned_private_repos
        case private_gists
        case disk_usage
        case collaborators
        case billing_email
        case default_repository_permission
        case members_can_create_repositories
        case two_factor_requirement_enabled
        case members_allowed_repository_creation_type
        case members_can_create_public_repositories
        case members_can_create_private_repositories
        case members_can_create_internal_repositories
        case plan
        
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let id                                      : Int
    let login                                   : String
    let name                                    : String?
    let nodeID                                  : String
    let URL                                     : String
    let reposURL                                : String
    let eventsURL                               : String
    let hooksURL                                : String
    let issuesURL                               : String
    let membersURL                              : String
    let publicMembersURL                        : String
    let avatarURL                               : String
    let description                             : String
    let followers                               : Int?
    let following                               : Int?
    let company                                 : String?
    let blog                                    : String?
    let location                                : String?
    let email                                   : String?
    let isVerified                              : Bool?
    let hasOrganizationProjects                 : Bool?
    let hasRepositoryProjects                   : Bool?
    let publicRepos                             : Int?
    let publicGists                             : Int?
    let htmlURL                                 : String?
    let createdAt                               : Date?
    // var type                                   :
    let totalPrivateRepos                       : Int?
    let ownedPrivateRepos                       : Int?
    let privateGists                            : Int?
    let diskUsage                               : Int?
    let collaborators                           : Int?
    let billingEmail                            : String?
    //let defaultRepositoryPermission             :
    let membersCanCreateRepositories            : Bool?
    let twoFactorRequirementEnabled             : Bool?
    //var membersAllowedRepositoryCreationType    :
    let membersCanCreatePublicRepositories      : Bool?
    let membersCanCreatePrivateRepositories     : Bool?
    let membersCanCreateInternalRepositories    : Bool?
    // var plan :
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    public required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHOrganizationEntity.CodingKeys.self)
        
        /// Initialize instance properties
        self.id     = try container.decode(Int.self   , forKey: .id)
        self.login  = try container.decode(String.self, forKey: .login)
        
        do      { self.name = try container.decode(String.self, forKey: .name) }
        catch   { self.name = nil }
        
        do      { self.nodeID = try container.decode(String.self, forKey: .node_id) }
        catch   { self.nodeID = "" }
        
        do      { self.URL = try container.decode(String.self, forKey: .url) }
        catch   { self.URL = "" }
        
        do      { self.reposURL = try container.decode(String.self, forKey: .repos_url) }
        catch   { self.reposURL = "" }
        
        do      { self.eventsURL = try container.decode(String.self, forKey: .events_url) }
        catch   { self.eventsURL = "" }
        
        do      { self.hooksURL = try container.decode(String.self,forKey:.hooks_url ) }
        catch   { self.hooksURL = "" }
        
        do      { self.issuesURL = try container.decode(String.self,forKey: .issues_url ) }
        catch   { self.issuesURL = "" }
        
        do      { self.membersURL = try container.decode(String.self,forKey: . members_url) }
        catch   { self.membersURL = "" }
        
        do      { self.publicMembersURL = try container.decode(String.self,forKey: .public_members_url) }
        catch   { self.publicMembersURL = "" }
        
        do      { self.avatarURL = try container.decode(String.self,forKey: .avatar_url) }
        catch   { self.avatarURL = "" }
        
        do      { self.description = try container.decode(String.self,forKey: .description) }
        catch   { self.description = "" }
        
        do      { self.following = try container.decode(Int.self,forKey: .following) }
        catch   { self.following = nil }
        
        do      { self.followers = try container.decode(Int.self,forKey: .followers) }
        catch   { self.followers = nil }
        
        do      { self.company = try container.decode(String.self,forKey: .company) }
        catch   { self.company = nil }
        
        do      { self.blog = try container.decode(String.self,forKey: .blog) }
        catch   { self.blog = nil }
        
        do      { self.location = try container.decode(String.self,forKey: .location) }
        catch   { self.location = nil }
        
        do      { self.email = try container.decode(String.self,forKey: .email) }
        catch   { self.email = nil }
        
        do      { self.isVerified = try container.decode(Bool.self,forKey: .is_verified) }
        catch   { self.isVerified = nil }
        
        do      { self.hasOrganizationProjects = try container.decode(Bool.self,forKey: .has_organization_projects) }
        catch   { self.hasOrganizationProjects = nil }
        
        do      { self.hasRepositoryProjects = try container.decode(Bool.self,forKey: .has_repository_projects) }
        catch   { self.hasRepositoryProjects = nil }
        
        do      { self.publicRepos = try container.decode(Int.self,forKey: .public_repos) }
        catch   { self.publicRepos = nil }
        
        do      { self.publicGists = try container.decode(Int.self,forKey: .public_gists) }
        catch   { self.publicGists = nil }
        
        do      { self.htmlURL = try container.decode(String.self,forKey: .html_url) }
        catch   { self.htmlURL = nil }
        
        do      { self.createdAt = try container.decode(Date.self,forKey: .created_at) }
        catch   { self.createdAt = nil }
        
        do      { self.totalPrivateRepos = try container.decode(Int.self,forKey: .total_private_repos) }
        catch   { self.totalPrivateRepos = nil }
        
        do      { self.ownedPrivateRepos = try container.decode(Int.self,forKey: .owned_private_repos) }
        catch   { self.ownedPrivateRepos = nil }
        
        do      { self.privateGists = try container.decode(Int.self,forKey: .private_gists) }
        catch   { self.privateGists = nil }
        
        do      { self.diskUsage = try container.decode(Int.self,forKey: .disk_usage) }
        catch   { self.diskUsage = nil }
        
        do      { self.collaborators = try container.decode(Int.self,forKey: .collaborators) }
        catch   { self.collaborators = nil }
        
        do      { self.billingEmail = try container.decode(String.self,forKey: .billing_email) }
        catch   { self.billingEmail = nil }
        
        do      { self.membersCanCreateRepositories = try container.decode(Bool.self,forKey: .collaborators) }
        catch   { self.membersCanCreateRepositories = nil }
        
        do      { self.twoFactorRequirementEnabled = try container.decode(Bool.self,forKey: .collaborators) }
        catch   { self.twoFactorRequirementEnabled = nil }
        
        do      { self.membersCanCreatePublicRepositories = try container.decode(Bool.self,forKey: .collaborators) }
        catch   { self.membersCanCreatePublicRepositories = nil }
        
        do      { self.membersCanCreatePrivateRepositories = try container.decode(Bool.self,forKey: .collaborators) }
        catch   { self.membersCanCreatePrivateRepositories = nil }
        
        do      { self.membersCanCreateInternalRepositories = try container.decode(Bool.self,forKey: .collaborators) }
        catch   { self.membersCanCreateInternalRepositories = nil }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
