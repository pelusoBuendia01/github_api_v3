//
//  File.swift
//  
//
//  Created by Francisco Romero on 14/02/20.
//

import Foundation

public protocol GithubAPI {
    
    // MARK: PUBLIC VARIABLE
    //__________________________________________________________________________________________________________________
    var appRepo             : AppsRepo              { get }
    var issuesRepo          : IssuesRepo            { get }
    var migrationRep        : MigrationRepo         { get }
    var miscellaneousRepo   : MiscellaneousRepo     { get }
    var organizationRepo    : OrganizationRepo      { get }
    var projectRepo         : ProjectRepo           { get }
    var pullRequestRepo     : PullRequestRepo       { get }
    var reactionRepo        : ReactionsRepo         { get }
    var searchRepo          : SearchRepo            { get }
    var teamRepo            : TeamsRepo             { get }
    var userRepo            : UserRepo              { get }    
}
