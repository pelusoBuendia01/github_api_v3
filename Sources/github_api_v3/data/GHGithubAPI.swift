//
//  File.swift
//  
//
//  Created by Francisco Romero on 15/02/20.
//

import Foundation

class GHGithubAPI: GithubAPI {
        
    
    // MARK: PRIVATE PROPERTIES
    //__________________________________________________________________________________________________________________
    private let session : GHSession

    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let appRepo             : AppsRepo
    let issuesRepo          : IssuesRepo
    let migrationRep        : MigrationRepo
    let miscellaneousRepo   : MiscellaneousRepo
    let organizationRepo    : OrganizationRepo
    let projectRepo         : ProjectRepo
    let pullRequestRepo     : PullRequestRepo
    var reactionRepo        : ReactionsRepo
    let repositoryRepo      : RepositoryRepo
    let searchRepo          : SearchRepo
    let teamRepo            : TeamsRepo
    let userRepo            : UserRepo
    
    init(session: GHSession) {
        
        /// initialize instance variables
        self.session            = session        
        self.appRepo            = GHAppsRepo                (session: self.session)
        self.issuesRepo         = GHIssuesRepo              (session: self.session)
        self.migrationRep       = GHMigrationRepo           (session: self.session)
        self.miscellaneousRepo  = GHMiscellaneousRepo       (session: self.session)
        self.organizationRepo   = GHOrganizationRepository  (session: self.session)
        self.projectRepo        = GHProjectRepository       (session: self.session)
        self.pullRequestRepo    = GHPullRequestRepo         (session: self.session)
        self.reactionRepo       = GHReactionsRepo           (session: self.session)
        self.repositoryRepo     = GHRepositoryRepository    (session: self.session)
        self.searchRepo         = GHSearchRepo              (session: self.session)
        self.teamRepo           = GHTeamsRepo               (session: self.session)
        self.userRepo           = GHUserRepo          (session: self.session)
        
        
        
    }
    
}
