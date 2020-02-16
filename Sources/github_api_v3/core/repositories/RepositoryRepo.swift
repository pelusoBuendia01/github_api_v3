//
//  RepositoryRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com

import Foundation

public protocol RepositoryRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultRepository                  = (Result< RepositoryEntity     ,Error> ) -> Void
    typealias ResultResultRepositoryList        = (Result<[RepositoryEntity]    ,Error> ) -> Void
    typealias ResultResultRepositoryTopicList   = (Result<[String]              ,Error> ) -> Void
    typealias ResultLanguageList                = (Result<[String]              ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    var branches        : RepositoryBanchesRepo         { get }
    var collaborators   : RepositoryCollaboratorsRepo   { get }
    var comments        : RepositoryCommentsRepo        { get }
    var commits         : RepositoryCommitsRepo         { get }
    var community       : RepositoryCommunityRepo       { get }
    var contents        : RepositoryContentsRepo        { get }
    var deployKeys      : RepositoryDeployKeysRepo      { get }
    var deployments     : RepositoryDeploymentsRepo     { get }
    var downloads       : RepositoryDownloadsRepo       { get }
    var forks           : RepositoryForksRepo           { get }
    var invitations     : RepositoryInvitationsRepo     { get }
    var mergin          : RepositoryMerginRepo          { get }
    var pages           : RepositoryPagesRepo           { get }
    var releases        : RepositoryReleasesRepo        { get }
    var statics         : RepositoryStaticsRepo         { get }
    var statuses        : RepositoryStatusesRepo        { get }
    var traffic         : RepositoryTrafficRepo         { get }
    var webhooks        : RepositoryWebhooksRepo        { get }
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    func myRepositories     (result                 : @escaping ResultResultRepositoryList) -> Void
    
    func repositoryListOf   (username               : String,
                             type                   : RepositoryType?,
                             sort                   : RepositorySortType?,
                             direction              : RepositorySortDirectionType?,
                             result                 : @escaping ResultResultRepositoryList)
    
    func repositoryListOf   (organization           : String,
                             type                   : RepositoryType?,
                             sort                   : RepositorySortType?,
                             direction              : RepositorySortDirectionType?,
                             result                 : @escaping ResultResultRepositoryList)
    
    func repositoryListSince (repoId                : Int?,
                             result                 : @escaping ResultResultRepositoryList)
    
    func create              (with name             : String,
                             description            : String?,
                             homepage               : String?,
                             isPrivate              : Bool?,
                             visibility             : RepositoryVisibility?,
                             hasIssues              : Bool?,
                             hasProjects            : Bool?,
                             hasWiki                : Bool?,
                             isTemplate             : Bool?,
                             teamId                 : Int?,
                             autoInit               : Bool?,
                             gitIgnoreTemplate      : String?,
                             licenseTemplate        : String?,
                             allowSquashMerge       : Bool?,
                             allowMeregeCommit      : Bool?,
                             allowRebaseMerge       : Bool?,
                             deleteBranchOnMerege   : Bool?,
                             result                 : @escaping ResultRepository)
    
    func create             (from templateOwner     : String,
                             repo                   : String,
                             newOwner               : String,
                             name                   : String,
                             description            : String,
                             private                : Bool  ,
                             result                 : @escaping ResultRepository)
    
    func single             (owner                  : String,
                             repo                   : String,
                             result                 : @escaping ResultRepository)
    
    func update             (name                   : String,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (description            : String,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (homepage               : String,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (isPrivate              : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    
    func update             (visibility             : RepositoryVisibility,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (hasIssues              : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (hasProjects            : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    
    func update             (hasWiki                : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (isTemplate             : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    
    func update             (defaultBranch          : String,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (allowSquashMerge       : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (allowMergeCommit       : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (allowRebaseMerge       : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (deleteBranchOnMerge    : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func update             (archived               : Bool,
                             of owner               : String,
                             in repository          : String,
                             result                 : @escaping ResultRepository)
    
    func getTopics          (from owner             : String,
                             in repo                : String,
                             result                 : @escaping ResultResultRepositoryTopicList)
    
    func updateTopics       (names                  : [String],
                             from owner             : String,
                             in repo                : String,
                             result                 : @escaping ResultResultRepositoryTopicList)
    
    func verifyVulnerabilityAlerts (
                            from owner              : String,
                            in repo                 : String,
                            result                  : @escaping GHConfiguration.RESTConfirmation)
    
    func enableVulnerabilityAlerts (
                            from owner              : String,
                            in repo                 : String,
                            result                  : @escaping GHConfiguration.RESTConfirmation)
    
    func disableVulnerabilityAlerts (
                            from owner              : String,
                            in repo                 : String,
                            result                  : @escaping GHConfiguration.RESTConfirmation)
    
    func enableAutomatedSecurityFixes (
                            from owner              : String,
                            in repo                 : String,
                            result                  : @escaping GHConfiguration.RESTConfirmation)
    
    func disableAutomatedSecurityFixes (
                            from owner              : String,
                            in repo                 : String,
                            result                  : @escaping GHConfiguration.RESTConfirmation)
    
    func contributors       (of owner              : String,
                             in repo               : String,
                             result                : @escaping UserRepo.ResultUserList )
    
    func languages          (of owner              : String,
                             in repo               : String,
                             result                : @escaping ResultLanguageList) -> Void
    
    func teams              (of owner              : String,
                             in repo               : String,
                             result                : @escaping ResultLanguageList) -> Void
}

public protocol RepositoryBanchesRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultBranch                              = (Result< BranchEntity                             ,Error> ) -> Void
    typealias ResultBranchList                          = (Result< BranchEntity                             ,Error> ) -> Void
    typealias ResultBranchProtection                    = (Result< BranchProtectionEntity                   ,Error> ) -> Void
    typealias ResultProtectionRequiredStatusChecks      = (Result< RequiredStatusChecksEntity     ,Error> ) -> Void
    typealias ResultRequiredPullRequestReviews          = (Result< RequiredPullRequestReviewsEntity         ,Error> ) -> Void
    typealias ResultBranchProtectionRequiredSignatures  = (Result< Bool ,Error> ) -> Void
    typealias ResultBranchRestriction                   = (Result< BranchRestrictionEntity ,Error> ) -> Void
    
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
        
    func listBranches       (owner                  : String,
                             repo                   : String,
                             result                 : @escaping ResultBranch ) -> Void
    
    func single             (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranch ) -> Void
    
    func protectionOf       (owner                  : String,
                            repo                    : String,
                            branchName              : String,
                            result                  : @escaping ResultBranchProtection)
    
    func updateProtection   (requiredStatusChecks   : RequiredStatusChecksEntity?,
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchProtection)
    
    func updateProtection   (enforceAdmins          : Bool?,
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchProtection)
    
    func updateProtection   (requiredPullRequestReviews : Bool?,
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchProtection)
        
    func updateProtection   (restriction            : BranchRestrictionEntity?,
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchProtection)
    
    func updateProtection   (requiredLinearHistory  : Bool,
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchProtection)
    
    func updateProtection   (allowForcePushes       : Bool,
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchProtection)
    
    func updateProtection   (allowDeletions         : Bool,
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchProtection)
    
    func deleteProtection   (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchProtection)
    
    func getRequiresStatusCheck
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultProtectionRequiredStatusChecks)
    
    
    func updateRequiresStatusCheck
                            (strict                 : Bool,
                             contexts               : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultProtectionRequiredStatusChecks)
    
    func removeRequiresStatusCheck
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultProtectionRequiredStatusChecks)
    
    func getRequiredPullRequestReview
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultRequiredPullRequestReviews)
    
    func updateRequiredPullRequestReview
                            (dismissalRestriction   : DismissalRestrictionsEntity,
                             dismissStaleReviews    : Bool,
                             requireCodeOwnerReviews: Bool,
                             requiredApprovingReviewCount : Int,
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultRequiredPullRequestReviews)
    
    func removeRequiredPullRequestReview
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultRequiredPullRequestReviews)
    
    func getRequireSignature
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultRequiredPullRequestReviews)
    
    func addRequireSignature
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultRequiredPullRequestReviews)
    
    func removeRequireSignature
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultRequiredPullRequestReviews)
    
    func getBranchRestriction
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchRestriction)
    
    
    func removeBranchRestriction
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping ResultBranchRestriction)
    
    func getTeamsWithAccess
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping TeamsRepo.ResultTeamList)
    
    func replaceTeamsWithAccess
                            (teamSlugs              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping TeamsRepo.ResultTeamList)
    
    func addTeamsWithAccess
                            (teamSlugs              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping TeamsRepo.ResultTeamList)
    
    func removeTeamsWithAccess
                            (teamSlugs              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping TeamsRepo.ResultTeamList)
    
    
    func getUsersWithAccess
                            (owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping UserRepo.ResultUserList)
    
    func replaceUsersWithAccess
                            (usernames              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping UserRepo.ResultUserList)
    
    func addUsersWithAccess
                            (usernames              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping UserRepo.ResultUserList)
    
    func removeUsersWithAccess
                            (usernames              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping UserRepo.ResultUserList)
        
    func getAppsWithAccess
                            (repo                   : String,
                             branchName             : String,
                             result                 : @escaping AppsRepo.ResultAppList)
    
    func replaceAppWithAccess
                            (appSlugs              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping AppsRepo.ResultAppList)
    
    func addAppsWithAccess
                            (appSlugs              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping AppsRepo.ResultAppList)
    
    func removeAppWithAccess
                            (appSlugs              : [String],
                             owner                  : String,
                             repo                   : String,
                             branchName             : String,
                             result                 : @escaping AppsRepo.ResultAppList)
        
    
    
}

public protocol RepositoryCollaboratorsRepo : GHRepository {
 
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    func listCollaborators  (affiliation    : GHAffiliation?,
                             owner          : String,
                             repo           : String,
                             result         : @escaping UserRepo.ResultUserList )
    
    func isCollaborator     (username       : String,
                             owner          : String,
                             repo           : String,
                             result         : @escaping UserRepo.ResultUserList )
    
    func verifyPermision    (permision      : GHPermission,
                             username       : String,
                             owner          : String,
                             repo           : String,
                             result         : @escaping GHConfiguration.RESTConfirmation )
    
    
    func addCollaborator    (permision      : GHPermission,
                             username       : String,
                             owner          : String,
                             repo           : String,
                             result         : @escaping RepositoryInvitationsRepo.ResultInvitationList )
    
    
    func removeCollaborator (username       : String,
                             owner          : String,
                             repo           : String,
                             result         : @escaping GHConfiguration.RESTConfirmation )
    
}

public protocol RepositoryCommentsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultComment     = (Result< RepositoryCommentEntity  ,Error> ) -> Void
    typealias ResultCommentList = (Result<[RepositoryCommentEntity] ,Error> ) -> Void
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func getRepositoryComments
                            (owner          : String,
                             repo           : String,
                             result         : @escaping ResultCommentList)
    
    func getCommitComments  (owner          : String,
                             repo           : String,
                             commitSHA      : String,
                             result         : @escaping ResultCommentList)
    
    func addCommitComment  (body            : String,
                            path            : String?,
                            position        : Int?,
                            owner           : String,
                            repo            : String,
                            commitSHA       : String,
                            result          : @escaping ResultCommentList)
    
    func getComment         (owner          : String,
                             repo           : String,
                             commentId      : Int   ,
                             result         : @escaping ResultComment)
    
    func updateComment      (body           : String,
                             owner          : String,
                             repo           : String,
                             commentId      : Int   ,
                             result         : @escaping ResultComment)
    
    func removeComment      (owner          : String,
                             repo           : String,
                             commentId      : Int   ,
                             result         : @escaping GHConfiguration.RESTConfirmation)
    
}

public protocol RepositoryCommitsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryCommunityRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryContentsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryDeployKeysRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryDeploymentsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryDownloadsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryForksRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryInvitationsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultInvitation      = (Result< BranchEntity ,Error> ) -> Void
    typealias ResultInvitationList  = (Result< BranchEntity ,Error> ) -> Void
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryMerginRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryPagesRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryReleasesRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryStaticsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryStatusesRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryTrafficRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol RepositoryWebhooksRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}
