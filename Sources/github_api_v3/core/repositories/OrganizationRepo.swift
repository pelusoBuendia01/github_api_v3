//
//  OrganizationRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com

import Foundation

public protocol OrganizationRepo : GHRepository{
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultOrg     = (Result< OrganizationEntity   ,Error>)  -> Void
    typealias ResultOrgList = (Result<[OrganizationEntity]  ,Error>)  -> Void
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    var blocks                  : OrganizationBlocksRepo                { get }
    var members                 : OrganizationMembersRepo               { get }
    var outsideCollaborators    : OrganizationOutsideCollaboratorsRepo  { get }
    var webhooks                : OrganizationWebhooksRepo              { get }
    
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    /// listOAuthOrganizations
    ///
    /// - parameter result: result callback completition
    /// - returns: Void
    func listOAuthOrganizations (result     : @escaping ResultOrgList)
    
    /// listOrganizations
    ///
    /// - parameter since_orgID: the organization id since will be search
    /// - parameter result: result callback completition
    /// - returns: Void
    func listOrganizations      (since orgID: Int?,
                                 result     : @escaping ResultOrgList)
    
    /// listOrganizations
    ///
    /// - parameter of_username: the user name to seacht
    /// - parameter result: result callback completition
    /// - returns: Void
    func listOrganizations      (of username: String,
                                 result     : @escaping ResultOrgList)
    
    /// single
    ///
    /// - parameter login: the organization login name
    /// - parameter result: result callback completition
    /// - returns: Void
    func single                 (login      : String,
                                 result     : @escaping ResultOrg )
        
    /// update
    ///
    /// - parameter billingEmail: the billingEmail
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (billingEmail                           : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter company: the company name to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (company                                : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter email: the email to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (email                                  : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter location: the location to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (location                               : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter name: the name to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (name                                   : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter description: the description to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (description                            : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter hasOrganizationProjects: the has Organization Projects flag to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (hasOrganizationProjects                : Bool,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter hasRepositoryProjects: the has Repository Projects flag to be update
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (hasRepositoryProjects                  : Bool,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter defaultRepositoryPermission: the defaul tRepository Permission option to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (defaultRepositoryPermission            : OrganizationRepositoryPermission,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter membersCanCreateRepositories: the members Can Create Repositories flag to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (membersCanCreateRepositories           : Bool,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter membersCanCreateInternalRepositories: the members Can Create Internal Repositories flag to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (membersCanCreateInternalRepositories   : Bool,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter membersCanCreatePrivateRepositories: the members Can Create Private Repositories flat to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (membersCanCreatePrivateRepositories    : Bool,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter membersCanCreatePublicRepositories: the members Can Create Public Repositories flag to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (membersCanCreatePublicRepositories     : Bool,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    /// update
    ///
    /// - parameter membersAllowedRepositoryCreationType: the members Allowed Repository Creation Type to be updated
    /// - parameter in_orgLogin: the organization login name to be updated
    /// - parameter result: result callback completition
    /// - returns: Void
    func update                 (membersAllowedRepositoryCreationType   : OrganizationMembersAllowedRepositoryCreationType,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
}



public protocol OrganizationBlocksRepo : GHRepository{
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func listBlockedUsers   ( result    : @escaping UserRepo.ResultUserList             ) -> Void
    
    func verify             ( username  : String,
                              result    : @escaping GHConfiguration.RESTConfirmation    ) -> Void
    
    func block              ( username  : String,
                              result    : @escaping GHConfiguration.RESTConfirmation    ) -> Void
        
    func unblock            ( username  : String,
                              result    : @escaping GHConfiguration.RESTConfirmation    ) -> Void
    
}


public protocol OrganizationMembersRepo : GHRepository{
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol OrganizationOutsideCollaboratorsRepo : GHRepository{
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

public protocol OrganizationWebhooksRepo : GHRepository{
    
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
        
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}

