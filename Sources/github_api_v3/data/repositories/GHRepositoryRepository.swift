//
//  GHRepositoryRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 05/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

internal class GHRepositoryRepository       : RepositoryRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    static let paramType                    : String = "type"
    static let paramSort                    : String = "sort"
    static let paramDirection               : String = "direction"
    static let paramSince                   : String = "since"
    static let paramIsPrivate               : String = "private"
    static let paramName                    : String = GHRepositoryEntity.CodingKeys.name.rawValue
    static let paramDescription             : String = GHRepositoryEntity.CodingKeys.description.rawValue
    static let paramHomepage                : String = GHRepositoryEntity.CodingKeys.homepage.rawValue
    static let paramPrivate                 : String = GHRepositoryEntity.CodingKeys.isPrivate.rawValue
    static let paramVisibility              : String = GHRepositoryEntity.CodingKeys.visibility.rawValue
    
    static let paramHasIsues                : String = GHRepositoryEntity.CodingKeys.visibility.rawValue
    static let paramHasProjects             : String = GHRepositoryEntity.CodingKeys.visibility.rawValue
    static let paramHasWiki                 : String = GHRepositoryEntity.CodingKeys.hasWiki.rawValue
    static let paramIsTemplate              : String = GHRepositoryEntity.CodingKeys.isTemplate.rawValue
    static let paramDefaultNranch           : String = GHRepositoryEntity.CodingKeys.defaultBranch.rawValue
    
    static let paramTeamId                  : String = "team_id"
    static let paramAutoInit                : String = "auto_init"
    static let paramGitIgnoreTemplate       : String = "gitignore_template"
    static let paramLicenseTemplate         : String = "license_template"
    static let paramAllowSquashMerge        : String = "allow_squash_merge"
    static let paramAllowMergeCommit        : String = "allow_merge_commit"
    static let paramAllowRebaseMerge        : String = "allow_rebase_merge"
    static let paramDeleteBranchOnMerege    : String = "delete_branch_on_merge"
    static let paramArchived                : String = "archived"
    static let paramNames                   : String = "names"
    
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    static let pathRepos            : String = "/repos"
    static let pathRepositories     : String = "/repositories"
    static let pathTopics           : String = "/topics"
    static let pathContributors     : String = "/contributors"
    static let pathLanguages        : String = "/languages"
    static let pathTags             : String = "/tags"
    static let pathDispatches       : String = "/dispatches"
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    var session: GHSession
    
    var branches        : RepositoryBanchesRepo
    var collaborators   : RepositoryCollaboratorsRepo
    var comments        : RepositoryCommentsRepo
    var commits         : RepositoryCommitsRepo
    var community       : RepositoryCommunityRepo
    var contents        : RepositoryContentsRepo
    var deployKeys      : RepositoryDeployKeysRepo
    var deployments     : RepositoryDeploymentsRepo
    var downloads       : RepositoryDownloadsRepo
    var forks           : RepositoryForksRepo
    var invitations     : RepositoryInvitationsRepo
    var mergin          : RepositoryMerginRepo
    var pages           : RepositoryPagesRepo
    var releases        : RepositoryReleasesRepo
    var statics         : RepositoryStaticsRepo
    var statuses        : RepositoryStatusesRepo
    var traffic         : RepositoryTrafficRepo
    var webhooks        : RepositoryWebhooksRepo
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    public init(session : GHSession){
        
        /// initialize instnace variables
        self.session        = session
        self.branches       = GHRepositoryBanchesRepo       (session: session)
        self.collaborators  = GHRepositoryCollaboratorsRepo (session: session)
        self.comments       = GHRepositoryCommentsRepo      (session: session)
        self.commits        = GHRepositoryCommitsRepo       (session: session)
        self.community      = GHRepositoryCommunityRepo     (session: session)
        self.contents       = GHRepositoryContentsRepo      (session: session)
        self.deployKeys     = GHRepositoryDeployKeysRepo    (session: session)
        self.deployments    = GHRepositoryDeploymentsRepo   (session: session)
        self.downloads      = GHRepositoryDownloadsRepo     (session: session)
        self.forks          = GHRepositoryForksRepo         (session: session)
        self.invitations    = GHRepositoryInvitationsRepo   (session: session)
        self.mergin         = GHRepositoryMerginRepo        (session: session)
        self.pages          = GHRepositoryPagesRepo         (session: session)
        self.releases       = GHRepositoryReleasesRepo      (session: session)
        self.statics        = GHRepositoryStaticsRepo       (session: session)
        self.statuses       = GHRepositoryStatusesRepo      (session: session)
        self.traffic        = GHRepositoryTrafficRepo       (session: session)
        self.webhooks       = GHRepositoryWebhooksRepo      (session: session)
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________
    
    func myRepositories                     (result                 : @escaping ResultResultRepositoryList) {
        
        /// initialize local variables
        var path : String = GHUserRepo.pathAuthenticated
        path             += GHRepositoryRepository.pathRepos
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch (RESTResult) {
            case .failure(let error): do { result(.failure(error)) }
            case .success(let response) : do {
                
                do {
                    let repos = try self.session.decoder.decode([GHRepositoryEntity].self, from: response.data)
                    result(.success(repos))
                    
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }                                                
                
                }
            }
            
        }
        //result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
        
    }
    
    func repositoryListOf                   (username               : String,
                                             type                   : RepositoryType?,
                                             sort                   : RepositorySortType?,
                                             direction              : RepositorySortDirectionType?,
                                             result                 : @escaping ResultResultRepositoryList) {
        
        /// initialize local variables
        let paramType        = type         != nil ? type!      : RepositoryType.from                (string: "")
        let paramSort        = sort         != nil ? sort!      : RepositorySortType.from            (string: "")
        let paramDirection   = direction    != nil ? direction! : RepositorySortDirectionType.from   (string: "")
        
        var path : String    = GHUserRepo.pathAuthenticated
        path                += GHRepositoryRepository.pathRepos
        path                += "?\(GHRepositoryRepository.paramType     )=\(paramType.rawValue      )"
        path                += "&\(GHRepositoryRepository.paramSort     )=\(paramSort.rawValue      )"
        path                += "&\(GHRepositoryRepository.paramDirection)=\(paramDirection.rawValue)"
        
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch (RESTResult) {
            case .failure(let error): do { result(.failure(error)) }
            case .success(let response) : do {
                
                do {
                    let repos = try self.session.decoder.decode([GHRepositoryEntity].self, from: response.data)
                    result(.success(repos))
                    
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
            
            }
        
        }
        
    }
    
    func repositoryListOf                   (organization           : String,
                                             type                   : RepositoryType?,
                                             sort                   : RepositorySortType?,
                                             direction              : RepositorySortDirectionType?,
                                             result                 : @escaping ResultResultRepositoryList) {
        
        /// initialize local variables
        let paramType        = type         != nil ? type!      : RepositoryType.from                (string: "")
        let paramSort        = sort         != nil ? sort!      : RepositorySortType.from            (string: "")
        let paramDirection   = direction    != nil ? direction! : RepositorySortDirectionType.from   (string: "")
        
        var path : String    = GHOrganizationRepository.pathOrgs
        path                += "/\(organization)"
        path                += GHRepositoryRepository.pathRepos
        path                += "?\(GHRepositoryRepository.paramType     )=\(paramType.rawValue      )"
        path                += "&\(GHRepositoryRepository.paramSort     )=\(paramSort.rawValue      )"
        path                += "&\(GHRepositoryRepository.paramDirection)=\(paramDirection.rawValue)"
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch (RESTResult) {
            case .failure(let error): do { result(.failure(error)) }
            case .success(let response) : do {
                
                do {
                    let repos = try self.session.decoder.decode([GHRepositoryEntity].self, from: response.data)
                    result(.success(repos))
                    
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
            
            }
        
        }
        
    }
    
    func repositoryListSince                (repoId                 : Int?,
                                             result                 : @escaping ResultResultRepositoryList) {
        
        /// initialize local variables
        let paramSince       = repoId != nil ? repoId! : 0
        var path : String    = GHRepositoryRepository.pathRepositories
        path                += "?\(GHRepositoryRepository.paramSince)=\(paramSince)"
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch (RESTResult) {
            case .failure(let error): do { result(.failure(error)) }
            case .success(let response) : do {
                
                do {
                    let repos = try self.session.decoder.decode([GHRepositoryEntity].self, from: response.data)
                    result(.success(repos))
                    
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                }
            
            }
        
        }
        
    }
    
    func     create                         (with name              : String,
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
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHUserRepo.pathAuthenticated
        path                += GHRepositoryRepository.pathRepos
        
        var param : [String:Any?]           = [ GHRepositoryRepository.paramName : name]
        if let paramDescription             = description           { param.updateValue(paramDescription            , forKey: GHRepositoryRepository.paramDescription           ) }
        if let paramHomepage                = homepage              { param.updateValue(paramHomepage               , forKey: GHRepositoryRepository.paramHomepage              ) }
        if let paramIsPrivate               = isPrivate             { param.updateValue(paramIsPrivate              , forKey: GHRepositoryRepository.paramPrivate               ) }
        if let paramVisibility              = visibility            { param.updateValue(paramVisibility             , forKey: GHRepositoryRepository.paramVisibility            ) }
        if let paramHasIssues               = hasIssues             { param.updateValue(paramHasIssues              , forKey: GHRepositoryRepository.paramHasIsues              ) }
        if let paramHasProjects             = hasProjects           { param.updateValue(paramHasProjects            , forKey: GHRepositoryRepository.paramHasProjects           ) }
        if let paramHasWiki                 = hasWiki               { param.updateValue(paramHasWiki                , forKey: GHRepositoryRepository.paramHasWiki               ) }
        if let paramIsTemplate              = isTemplate            { param.updateValue(paramIsTemplate             , forKey: GHRepositoryRepository.paramIsTemplate            ) }
        if let paramTeamId                  = teamId                { param.updateValue(paramTeamId                 , forKey: GHRepositoryRepository.paramTeamId                ) }
        if let paramAutoInit                = autoInit              { param.updateValue(paramAutoInit               , forKey: GHRepositoryRepository.paramAutoInit              ) }
        if let paramGitIgnoreTemplate       = gitIgnoreTemplate     { param.updateValue(paramGitIgnoreTemplate      , forKey: GHRepositoryRepository.paramGitIgnoreTemplate     ) }
        if let paramLicenseTemplate         = licenseTemplate       { param.updateValue(paramLicenseTemplate        , forKey: GHRepositoryRepository.paramLicenseTemplate       ) }
        if let paramAllowSquashMerge        = allowSquashMerge      { param.updateValue(paramAllowSquashMerge       , forKey: GHRepositoryRepository.paramAllowSquashMerge      ) }
        if let paramAllowMeregeCommit       = allowMeregeCommit     { param.updateValue(paramAllowMeregeCommit      , forKey: GHRepositoryRepository.paramAllowMergeCommit      ) }
        if let paramAllowRebaseMerge        = allowRebaseMerge      { param.updateValue(paramAllowRebaseMerge       , forKey: GHRepositoryRepository.paramAllowRebaseMerge      ) }
        if let paramDeleteBranchOnMerege    = deleteBranchOnMerege  { param.updateValue(paramDeleteBranchOnMerege   , forKey: GHRepositoryRepository.paramDeleteBranchOnMerege  ) }
                
        // execute http post request
        session.post(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let response) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: response.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
                
            }
        }
        
    }
    
    func create                             (from templateOwner     : String,
                                             repo                   : String,
                                             newOwner               : String,
                                             name                   : String,
                                             description            : String,
                                             private                : Bool,
                                             result                 : @escaping ResultRepository) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func single                             (owner                  : String,
                                             repo                   : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repo)"
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let response) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: response.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (name                   : String,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramName : name]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    func update                             (description            : String,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramDescription : description]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    func update                             (homepage               : String,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramHomepage : homepage]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (isPrivate                : Bool,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramIsPrivate : isPrivate]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (visibility             : RepositoryVisibility,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramVisibility : visibility]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    func update                             (hasIssues              : Bool,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramHasIsues : hasIssues]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    func update                             (hasProjects            : Bool,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramHasProjects : hasProjects]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (hasWiki                : Bool,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramHasWiki : hasWiki]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (isTemplate             : Bool,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
            
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramIsTemplate : isTemplate]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (defaultBranch          : String,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramDefaultNranch : defaultBranch]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (allowSquashMerge       : Bool,
                                             of owner               : String,
                                             in repository          : String,
                                             result                 : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramAllowSquashMerge : allowSquashMerge]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
        
    }
    
    func update                             (allowMergeCommit   : Bool,
                                             of owner           : String,
                                             in repository      : String,
                                             result             : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramAllowMergeCommit : allowMergeCommit]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (allowRebaseMerge   : Bool,
                                             of owner           : String,
                                             in repository      : String,
                                             result             : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramAllowRebaseMerge : allowRebaseMerge]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (deleteBranchOnMerge: Bool,
                                             of owner           : String,
                                             in repository      : String,
                                             result             : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramDeleteBranchOnMerege : deleteBranchOnMerge]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func update                             (archived           : Bool,
                                             of owner           : String,
                                             in repository      : String,
                                             result             : @escaping ResultRepository) {
        
        /// initialize local variables
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repository)"
        let param : [String:Any?] = [ GHRepositoryRepository.paramArchived : archived ]
        
        /// execute http path request
        session.patch(path, with: param) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) :
                do {
                    result(.failure(error))
                }
                
            case .success(let respone) :
                do {
                    
                    do {
                        let repo = try self.session.decoder.decode(GHRepositoryEntity.self, from: respone.data)
                        result(.success(repo))
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                    }
                    
                    
                }
                
            }
            
        }
        
    }
    
    func getTopics                          (from owner         : String,
                                             in repo            : String,
                                             result             : @escaping ResultResultRepositoryTopicList) {
        
        /// initialize local varaibles
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repo)"
        path                += GHRepositoryRepository.pathTopics
        
        /// execute http get request
        session.get(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    :
                do {
                    result(.failure(error))
                }
                
            case .success(let response) :
                do {
                    do {
                        GHUtils.printJson(data: response.data)
                        
                        
                        let topics  = try self.session.decoder.decode(GHRepositoryTopicsEntity.self, from: response.data)
                        result(.success(topics.names))
                        
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription )))
                    }
                }
                
            }
        }
        
    }
    
    func updateTopics                       (names              : [String],
                                             from owner         : String,
                                             in repo            : String,
                                             result             : @escaping ResultResultRepositoryTopicList) {
    
        /// initialize local varaibles
        var path : String    = GHRepositoryRepository.pathRepos
        path                += "/\(owner)"
        path                += "/\(repo)"
        path                += GHRepositoryRepository.pathTopics
        
        let params : [String:Any?] = [
            GHRepositoryRepository.paramNames : names
        ]
        

        
        /// execute http get request
        session.put(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    :
                do {
                    result(.failure(error))
                }
                
            case .success(let response) :
                do {
                    do {
                        
                        GHUtils.printJson(data: response.data)
                        
                        
                        let topics  = try self.session.decoder.decode(GHRepositoryTopicsEntity.self, from: response.data)
                        result(.success(topics.names))
                        
                    } catch {
                        result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription )))
                    }
                }
                
            }
        }
        
    }
    
    func verifyVulnerabilityAlerts          (from owner         : String,
                                             in repo            : String,
                                             result             : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func enableVulnerabilityAlerts          (from owner         : String,
                                             in repo            : String,
                                             result             : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func disableVulnerabilityAlerts         (from owner         : String,
                                             in repo            : String,
                                             result             : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func enableAutomatedSecurityFixes       (from owner         : String,
                                             in repo            : String,
                                             result             : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func disableAutomatedSecurityFixes      (from owner         : String,
                                             in repo            : String,
                                             result             : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func contributors                       (of owner           : String,
                                             in repo            : String,
                                             result             : @escaping (Result<[UserEntity], Error>) -> Void) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func languages                          (of owner           : String,
                                             in repo            : String,
                                             result             : @escaping ResultLanguageList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }
    
    func teams                              (of owner           : String,
                                             in repo            : String,
                                             result             : @escaping ResultLanguageList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "Not yet implemented [Work in progress 🚧]")))
    }

    
}


internal class GHRepositoryBanchesRepo      : RepositoryBanchesRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    static let paramProtected                       : String    = "protected"
    static let paramRequiredStatusChecks            : String    = "required_status_checks"
    static let paramEnforceAdmins                   : String    = "enforce_admins"
    static let paramRequiredPullRequestReviews      : String    = "required_pull_request_reviews"
    static let paramRestrictions                    : String    = "restrictions"
    static let paramRequiredLinearHistory           : String    = "required_linear_history"
    static let paramAllowForcePushes                : String    = "allow_force_pushes"
    static let paramAllowDeletions                  : String    = "allow_deletions"
    static let paramStrict                          : String    = "strict"
    static let paramContexts                        : String    = "contexts"
    static let paramDismissalRestrictions           : String    = "dismissal_restrictions"
    static let paramDismissStaleReviews             : String    = "dismiss_stale_reviews"
    static let paramRequireCodeOwnerReviews         : String    = "require_code_owner_reviews"
    static let paramRequiredApprovingReviewCount    : String    = "required_approving_review_count"
    static let paramUser                            : String    = "users"
    static let paramTeams                           : String    = "teams"
    static let paramApps                            : String    = "apps"
    
    
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    public static let pathBranches                  : String    = "/branches"
    public static let pathProtection                : String    = "/protection"
    public static let pathRequiredStatusChecks      : String    = "/required_status_checks"
    public static let pathContext                   : String    = "/contexts"
    public static let pathRestrictions              : String    = "/restrictions"
    public static let pathTeams                     : String    = "/teams"
    public static let pathUsers                     : String    = "/users"
    public static let pathApps                      : String    = "/apps"
    public static let pathRequiredPullRequestReview : String    = "/required_pull_request_reviews"
    public static let pathRequiredSignature         : String    = "/required_signatures"
    public static let pathEnforceAdmins             : String    = "/enforce_admins"
    

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryBanchesRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
    func listBranches                       (owner      : String,
                                             repo       : String,
                                             result     : @escaping ResultBranch ) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.listBranches : " + path)))
        
    }
    
    func single                             (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranch ) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.single : " + path)))
        
    }
    
    func protectionOf                       (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchProtection ) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.protectionOf : " + path)))
        
    }
    
    func updateProtection                   (requiredStatusChecks: RequiredStatusChecksEntity?,
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchProtection) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateProtection : " + path)))
        
    }
    
    func updateProtection                   (enforceAdmins: Bool?,
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchProtection) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateProtection : " + path)))
        
    }
    
    func updateProtection                   (requiredPullRequestReviews: Bool?,
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchProtection) {

        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateProtection : " + path)))
        
    }
    
    func updateProtection                   (restriction: BranchRestrictionEntity?,
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchProtection) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateProtection : " + path)))
        
                
    }
    
    func updateProtection                   (requiredLinearHistory: Bool,
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchProtection) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateProtection : " + path)))
        
        
    }
    
    func updateProtection                   (allowForcePushes: Bool,
                                             owner: String,
                                             repo: String,
                                             branchName: String,
                                             result: @escaping ResultBranchProtection) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateProtection : " + path)))
        
        
    }
    
    func updateProtection                   (allowDeletions: Bool,
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchProtection) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateProtection : " + path)))
        
        
    }
    
    func deleteProtection                   (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchProtection) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.deleteProtection : " + path)))
        
        
    }
    
    func getRequiresStatusCheck             (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultProtectionRequiredStatusChecks) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.getRequiresStatusCheck : " + path)))
        
        
    }
    
    func updateRequiresStatusCheck          (strict     : Bool,
                                             contexts   : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultProtectionRequiredStatusChecks) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateRequiresStatusCheck : " + path)))
        
        
    }
    
    func removeRequiresStatusCheck          (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultProtectionRequiredStatusChecks) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.removeRequiresStatusCheck : " + path)))
        
        
    }
    
    func getRequiredPullRequestReview       (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultRequiredPullRequestReviews) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.getRequiredPullRequestReview : " + path)))
        
        
    }
    
    func updateRequiredPullRequestReview    (dismissalRestriction           : DismissalRestrictionsEntity,
                                             dismissStaleReviews            : Bool,
                                             requireCodeOwnerReviews        : Bool,
                                             requiredApprovingReviewCount   : Int,
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultRequiredPullRequestReviews) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.updateRequiredPullRequestReview : " + path)))
        
        
    }
    
    func removeRequiredPullRequestReview    (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultRequiredPullRequestReviews) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.removeRequiredPullRequestReview : " + path)))
        
        
    }
    
    func getRequireSignature                (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultRequiredPullRequestReviews) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.getRequireSignature : " + path)))
        
        
    }
    
    func addRequireSignature                (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultRequiredPullRequestReviews) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.addRequireSignature : " + path)))
        
        
    }
    
    func removeRequireSignature             (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultRequiredPullRequestReviews) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.removeRequireSignature : " + path)))
        
        
    }
    
    func getBranchRestriction               (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchRestriction) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.getBranchRestriction : " + path)))
        
        
    }
    
    func removeBranchRestriction            (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping ResultBranchRestriction) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.removeBranchRestriction : " + path)))
        
        
    }
    
    func getTeamsWithAccess                 (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping TeamsRepo.ResultTeamList) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.getTeamsWithAccess : " + path)))
        
        
    }
    
    func replaceTeamsWithAccess             (teamSlugs  : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping TeamsRepo.ResultTeamList) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.replaceTeamsWithAccess : " + path)))
        
        
    }
    
    func addTeamsWithAccess                 (teamSlugs  : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping TeamsRepo.ResultTeamList) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.addTeamsWithAccess : " + path)))
        
        
    }
    
    func removeTeamsWithAccess              (teamSlugs  : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping TeamsRepo.ResultTeamList) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.removeTeamsWithAccess : " + path)))
        
        
    }
    
    func getUsersWithAccess                 (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping UserRepo.ResultUserList) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.getUsersWithAccess : " + path)))
        
        
    }
    
    func replaceUsersWithAccess             (usernames  : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping UserRepo.ResultUserList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.replaceUsersWithAccess : " + path)))
        
        
    }
    
    func addUsersWithAccess                 (usernames  : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping UserRepo.ResultUserList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.addUsersWithAccess : " + path)))
        
    }
    
    func removeUsersWithAccess              (usernames  : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping UserRepo.ResultUserList) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.removeUsersWithAccess : " + path)))
        
    }
    
    func getAppsWithAccess                  (owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping AppsRepo.ResultAppList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.getAppsWithAccess : " + path)))
        
    }
    
    func getAppsWithAccess                  (repo       : String,
                                             branchName : String,
                                             result     : @escaping AppsRepo.ResultAppList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.getAppsWithAccess : " + path)))
        
    }
    
    func replaceAppWithAccess               (appSlugs   : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping AppsRepo.ResultAppList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.replaceAppWithAccess : " + path)))
        
    }
    
    func addAppsWithAccess                  (appSlugs   : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping AppsRepo.ResultAppList) {
     
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.addAppsWithAccess : " + path)))
        
    }
    
    func removeAppWithAccess                (appSlugs   : [String],
                                             owner      : String,
                                             repo       : String,
                                             branchName : String,
                                             result     : @escaping AppsRepo.ResultAppList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryBanchesRepo.removeAppWithAccess : " + path)))
        
    }
    
}


internal class GHRepositoryCollaboratorsRepo: RepositoryCollaboratorsRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    
    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryCollaboratorsRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDE FUNCTIONS [GHRepositoryCollaboratorsRepo]
    //__________________________________________________________________________________________________________________

    func listCollaborators                  (affiliation: GHAffiliation?,
                                             owner      : String,
                                             repo       : String,
                                             result     : @escaping (Result<[UserEntity], Error>) -> Void) {
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCollaboratorsRepo.listCollaborators : " + path)))
        
    }
    
    func isCollaborator                     (username   : String,
                                             owner      : String,
                                             repo       : String,
                                             result     : @escaping (Result<[UserEntity], Error>) -> Void) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCollaboratorsRepo.isCollaborator : " + path)))
        
    }
    
    func verifyPermision                    (permision  : GHPermission,
                                             username   : String,
                                             owner      : String,
                                             repo       : String,
                                             result     : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCollaboratorsRepo.verifyPermision : " + path)))
        
    }
    
    func addCollaborator                    (permision  : GHPermission,
                                             username   : String,
                                             owner      : String,
                                             repo       : String,
                                             result     : @escaping RepositoryInvitationsRepo.ResultInvitationList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCollaboratorsRepo.addCollaborator : " + path)))
        
    }
    
    func removeCollaborator                 (username   : String,
                                             owner      : String,
                                             repo       : String,
                                             result     : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCollaboratorsRepo.removeCollaborator : " + path)))
                
    }
    
    
}


internal class GHRepositoryCommentsRepo     : RepositoryCommentsRepo {
    
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryCommentsRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
 
    
    // MARK: OVERRIDED PUBLIC FUNCTIONS [RepositoryCommentsRepo]
    //__________________________________________________________________________________________________________________
    
    func getRepositoryComments              (owner      : String,
                                             repo       : String,
                                             result     : @escaping ResultCommentList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCommentsRepo.getRepositoryComments : " + path)))
        
    }
    
    func getCommitComments                  (owner      : String,
                                             repo       : String,
                                             commitSHA  : String,
                                             result     : @escaping ResultCommentList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCommentsRepo.getCommitComments : " + path)))
        
    }
    
    func addCommitComment                   (body       : String,
                                             path       : String?,
                                             position   : Int?,
                                             owner      : String,
                                             repo       : String,
                                             commitSHA  : String,
                                             result     : @escaping ResultCommentList) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCommentsRepo.addCommitComment : " + path)))
        
    }
    
    func getComment                         (owner      : String,
                                             repo       : String,
                                             commentId  : Int,
                                             result     : @escaping ResultComment) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCommentsRepo.getComment : " + path)))
        
    }
    
    func updateComment                      (body       : String,
                                             owner      : String,
                                             repo       : String,
                                             commentId  : Int,
                                             result     : @escaping ResultComment) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCommentsRepo.updateComment : " + path)))
        
    }
    
    func removeComment                      (owner      : String,
                                             repo       : String,
                                             commentId  : Int,
                                             result     : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        var path : String    = ""
        path                += ""
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHRepositoryCommentsRepo.removeComment : " + path)))
        
    }
    
    
}


internal class GHRepositoryCommitsRepo      : RepositoryCommitsRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryCommitsRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryCommunityRepo    : RepositoryCommunityRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryCommunityRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryContentsRepo     : RepositoryContentsRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryContentsRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryDeployKeysRepo   : RepositoryDeployKeysRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryDeployKeysRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryDeploymentsRepo  : RepositoryDeploymentsRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryDeploymentsRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryDownloadsRepo    : RepositoryDownloadsRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryDownloadsRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryForksRepo        : RepositoryForksRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryForksRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryInvitationsRepo  : RepositoryInvitationsRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryInvitationsRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryMerginRepo       : RepositoryMerginRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryMerginRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryPagesRepo        : RepositoryPagesRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryPagesRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryReleasesRepo     : RepositoryReleasesRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryReleasesRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryStaticsRepo      : RepositoryStaticsRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryStaticsRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryStatusesRepo     : RepositoryStatusesRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryStatusesRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryTrafficRepo      : RepositoryTrafficRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryTrafficRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}


internal class GHRepositoryWebhooksRepo     : RepositoryWebhooksRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________

    // MARK: OVERRIDED PUBLIC PROPERTIES [RepositoryWebhooksRepo]
    //__________________________________________________________________________________________________________________
    var session: GHSession

    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
}

