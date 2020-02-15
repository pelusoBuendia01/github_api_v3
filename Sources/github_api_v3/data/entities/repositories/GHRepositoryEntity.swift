//
//  GHRepositoryEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

class GHRepositoryEntity : RepositoryEntity {
 
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String,CodingKey {
        case id                 = "id"
        case name               = "name"
        case owner              = "owner"
        case nodeId             = "node_id"
        case isPrivate          = "private"
        case archived           = "archived"
        case createdAt          = "created_at"
        case defaultBranch      = "default_branch"
        case description        = "description"
        case disabled           = "disabled"
        case fork               = "fork"
        case forks              = "forks"
        case forksCount         = "forks_count"
        case fullName           = "full_name"
        case gitURL             = "git_url"
        case hasDownloads       = "has_downloads"
        case hasIssues          = "has_issues"
        case hasPages           = "has_pages"
        case hasProjects        = "has_projects"
        case hasWiki            = "has_wiki"
        case homepage           = "homepage"
        case isTemplate         = "is_template"
        case language           = "language"
        case license            = "license"
        case openIssues         = "open_issues"
        case openIssuesCount    = "open_issues_count"
        case permissions        = "permissions"
        case pushedAt           = "pushed_at"
        case size               = "size"
        case stargazersCount    = "stargazers_count"
        case topics             = "topics"
        case updatedAt          = "updated_at"
        case url                = "url"
        case visibility         = "visibility"
        case watchers           = "watchers"
        case watchersCount      = "watchers_count"
        
        // TODO : 🏷 Implement decoding for below URL properties
        case archiveURL         = "archive_url"
        case assigneesURL       = "assignees_url"
        case branchesURL        = "branches_url"
        case cloneURL           = "clone_url"
        case collaboratorsURL   = "collaborators_url"
        case commentsURL        = "comments_url"
        case commitsURL         = "commits_url"
        case compareURL         = "compare_url"
        case contentsURL        = "contents_url"
        case contributorsURL    = "contributors_url"
        case blobsURL           = "blobs_url"
        case deploymentsURL     = "deployments_url"
        case downloadsURL       = "downloads_url"
        case eventsURL          = "events_url"
        case forksURL           = "forks_url"
        case keysURL            = "keys_url"
        case gitCommitsURL      = "git_commits_url"
        case gitRefsURL         = "git_refs_url"
        case gitTagsURL         = "git_tags_url"
        case hooksURL           = "hooks_url"
        case htmlURL            = "html_url"
        case issueCommentURL    = "issue_comment_url"
        case issueEventsURL     = "issue_events_url"
        case issuesURL          = "issues_url"
        case labelsURL          = "labels_url"
        case languagesURL       = "languages_url"
        case mergesURL          = "merges_url"
        case milestonesURL      = "milestones_url"
        case mirrorURL          = "mirror_url"
        case notificationsURL   = "notifications_url"
        case pullsURL           = "pulls_url"
        case releasesURL        = "releases_url"
        case sshURL             = "ssh_url"
        case stargazersURL      = "stargazers_url"
        case statusesURL        = "statuses_url"
        case subscribersURL     = "subscribers_url"
        case subscriptionURL    = "subscription_url"
        case svnURL             = "svn_url"
        case tagsURL            = "tags_url"
        case teamsURL           = "teams_url"
        case treesURL           = "trees_url"
        
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let id              : Int
    let name            : String
    let owner           : UserEntity?
    let nodeId          : String
    let isPrivate       : Bool
    let archived        : Bool?
    let createdAt       : Date?
    let defaultBranch   : String?
    let description     : String
    let disabled        : Bool?
    let fork            : Int
    let forks           : Int
    let forksCount      : Int
    let fullName        : String?
    let hasDownloads    : Bool?
    let hasIssues       : Bool?
    let hasPages        : Bool?
    let hasProjects     : Bool?
    let hasWiki         : Bool?
    let homepage        : String
    let isTemplate      : Bool?
    let language        : String?
    let license         : LicenseEntity?
    let openIssues      : Int
    let openIssuesCount : Int
    let permissions     : RepositoryPermisionEntity?
    let pushedAt        : Date?
    let size            : Int
    let stargazersCount : Int
    let topics          : [String]
    let updatedAt       : Date?
    let URL             : String
    let visibility      : RepositoryVisibility
    let watchers        : Int
    let watchersCount   : Int
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHRepositoryEntity.CodingKeys.self)
        
        /// Initialize instance properties
        self.id         = try container.decode(Int.self     , forKey: .id)
        self.name       = try container.decode(String.self  , forKey: .name)
        self.isPrivate  = try container.decode(Bool.self    , forKey: .isPrivate)
        
        do      { self.owner = try container.decode(GHUserEntity.self, forKey: .owner) }
        catch   { self.owner = nil }
        
        do      { self.nodeId = try container.decode(String.self, forKey: .nodeId) }
        catch   { self.nodeId = "" }
        
        do      { self.archived = try container.decode(Bool.self, forKey: .archived) }
        catch   { self.archived = nil }
        
        do      { self.createdAt = try container.decode(Date.self, forKey: .createdAt) }
        catch   { self.createdAt = nil }
        
        do      { self.defaultBranch = try container.decode(String.self, forKey: .defaultBranch) }
        catch   { self.defaultBranch = nil }
        
        do      { self.description = try container.decode(String.self, forKey: .description) }
        catch   { self.description = "" }
        
        do      { self.disabled = try container.decode(Bool.self, forKey: .disabled) }
        catch   { self.disabled = nil }
        
        do      { self.fork = try container.decode(Int.self, forKey: .fork) }
        catch   { self.fork = 0 }
        
        
        do      { self.forks = try container.decode(Int.self, forKey: .forks) }
        catch   { self.forks = 0 }
        
        
        do      { self.forksCount = try container.decode(Int.self, forKey: .forksCount) }
        catch   { self.forksCount = 0 }
        
        do      { self.fullName = try container.decode(String.self, forKey: .fullName) }
        catch   { self.fullName = nil }
        
        do      { self.hasDownloads = try container.decode(Bool.self, forKey: .hasDownloads) }
        catch   { self.hasDownloads = nil }
        
        do      { self.hasIssues = try container.decode(Bool.self, forKey: .hasIssues) }
        catch   { self.hasIssues = nil }
        
        do      { self.hasPages = try container.decode(Bool.self, forKey: .hasPages) }
        catch   { self.hasPages = nil }
        
        do      { self.hasProjects = try container.decode(Bool.self, forKey: .hasProjects) }
        catch   { self.hasProjects = nil }
        
        do      { self.hasWiki = try container.decode(Bool.self, forKey: .hasWiki) }
        catch   { self.hasWiki = nil }
        
        do      { self.homepage = try container.decode(String.self, forKey: .homepage) }
        catch   { self.homepage = "" }
        
        do      { self.isTemplate = try container.decode(Bool.self, forKey: .isTemplate) }
        catch   { self.isTemplate = nil }
            
        
        do      { self.language = try container.decode(String.self, forKey: .language) }
        catch   { self.language = nil }
        
        do      { self.license = try container.decode(GHLicenseEntity.self, forKey: .license ) }
        catch   { self.license = nil }
        
        do      { self.openIssues = try container.decode(Int.self, forKey: .openIssues) }
        catch   { self.openIssues = 0 }
        
        do      { self.openIssuesCount = try container.decode(Int.self, forKey: .openIssuesCount) }
        catch   { self.openIssuesCount = 0 }
                
        do      { self.permissions = try container.decode(GHRepositoryPermisionEntity.self, forKey: .permissions) as RepositoryPermisionEntity }
        catch   { self.permissions = nil }
        
        do      { self.pushedAt = try container.decode(Date.self, forKey: .pushedAt ) }
        catch   { self.pushedAt = nil }
        
        do      { self.size = try container.decode(Int.self, forKey: .size ) }
        catch   { self.size = 0 }
        
        do      { self.stargazersCount = try container.decode(Int.self, forKey: .stargazersCount ) }
        catch   { self.stargazersCount = 0 }
        
        do      { self.topics = try container.decode([String].self, forKey: .topics ) }
        catch   { self.topics = [] }
        
        do      { self.updatedAt = try container.decode(Date.self, forKey: .updatedAt ) }
        catch   { self.updatedAt = nil }
        
        do      { self.URL = try container.decode(String.self, forKey: .url ) }
        catch   { self.URL = "" }
        
        do      { self.watchers = try container.decode(Int.self, forKey: .watchers ) }
        catch   { self.watchers = 0 }
        
        do      { self.watchersCount = try container.decode(Int.self, forKey: .watchersCount ) }
        catch   { self.watchersCount = 0 }
        
        do      {
            let stringValue = try container.decode(String.self, forKey: .watchersCount )
            self.visibility = RepositoryVisibility.from(string: stringValue)
        }
        catch   { self.visibility = RepositoryVisibility.from(string: "") }
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }

}
