//
//  OrganizationRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 02/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol OrganizationRepo : GHRepository{
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultOrg     = (Result< OrganizationEntity   ,Error>)  -> Void
    typealias ResultOrgList = (Result<[OrganizationEntity]  ,Error>)  -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    func listOAuthOrganizations (result     : @escaping ResultOrgList)
    
    func listOrganizations      (since orgID: Int?,
                                 result     : @escaping ResultOrgList)
    
    func listOrganizations      (of username: String,
                                 result     : @escaping ResultOrgList)
    
    func single                 (login      : String,
                                 result     : @escaping ResultOrg )
        
    func update                 (billingEmail                           : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (company                                : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (email                                  : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (location                               : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (name                                   : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (description                            : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (hasOrganizationProjects                : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (hasRepositoryProjects                  : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (defaultRepositoryPermission            : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (membersCanCreateRepositories           : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (membersCanCreateInternalRepositories   : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (membersCanCreateCrivateRepositories    : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (membersCanCreatePublicRepositories     : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
    func update                 (membersAllowedRepositoryCreationType   : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg)
    
}

