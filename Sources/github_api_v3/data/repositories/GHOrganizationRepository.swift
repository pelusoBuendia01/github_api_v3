//
//  GHOrganizationRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 02/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation
import GitHubApiCore

internal class GHOrganizationRepository: OrganizationRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    private static let paramBillingEmail                            : String = "param_billing_email"
    private static let paramCompany                                 : String = "company"
    private static let paramEmail                                   : String = "email"
    private static let paramLocation                                : String = "location"
    private static let paramName                                    : String = "name"
    private static let paramDescription                             : String = "description"
    private static let paramHasOrganizationProjects                 : String = "has_organization_projects"
    private static let paramHasRepositoryProjects                   : String = "has_repository_projects"
    private static let paramDefault_repositoryPermission            : String = "default_repository_permission"
    private static let paramMembersCanCreateRepositories            : String = "members_can_create_repositories"
    private static let paramMembersCanCreate_internalRepositories   : String = "members_can_create_internal_repositories"
    private static let paramMembersCanCreatePrivateRepositories     : String = "members_can_create_private_repositories"
    private static let paramMembersCanCreatePublicRepositories      : String = "members_can_create_public_repositories"
    private static let paramMembersAllowedRepositoryCreationType    : String = "members_allowed_repository_creation_type"

        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    static let pathOrgs             : String = "/orgs"
    static let pathOrganizations    : String = "/organizations"
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    private static let paramSince   : String = "since"
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    public var session: GHSession
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    init(session : GHSession) {
        self.session = session
    }
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________
    public func listOAuthOrganizations (result: @escaping OrganizationRepo.ResultOrgList) {
        
        /// initialize local variables
        var path : String = GHUserRepository.pathAuthenticated
        path += GHOrganizationRepository.pathOrgs
         
        /// execute http get request
        session.get(path, with: nil) {
            /// once request response
            RESTResult in
            /// switch between result cases
            switch(RESTResult) {
             
            /// when result fails
            case .failure(let error) : do {
                result(.failure(error))
                 }
            /// when result success
            case .success(let response) : do {
                do {
                    let object = try self.session.decoder.decode([GHOrganizationEntity].self, from: response.data)
                    result(.success(object))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
            }
                
            }
         }
        
    }
    
    func listOrganizations      (since orgID: Int?,
                                 result     : @escaping OrganizationRepo.ResultOrgList) {
        
        /// inititalize local variables
        var path : String = GHOrganizationRepository.pathOrganizations
                
        
        if let orgId = orgID {
            path += "?\(GHOrganizationRepository.paramSince)=\(orgId)"
        }
        
        /// execute http get request
        session.get(path, with: nil) {
            /// once request response
            RESTResult in
            
            /// switch between result cases
            switch(RESTResult) {
            
            /// when result fails
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            /// when result success
            case .success(let response) : do {
                /// try to decode response data
                do {
                    let organizations = try self.session.decoder.decode([GHOrganizationEntity].self, from: response.data)
                    result(
                        .success(organizations)
                    )
                }
                /// when decode fails
                catch {
                    result(
                        .failure(
                            GHSession.SessionError.decodingError(message: error.localizedDescription)
                        )
                    )
                } }
            }
        }
                
    }
    
    func listOrganizations      (of username: String,
                                 result     : @escaping OrganizationRepo.ResultOrgList) {
        ///users/:username/orgs

        /// inititalize local variables
        var path : String = GHUserRepository.pathUsers
        path += "/\(username)"
        path += GHOrganizationRepository.pathOrgs        
         
        /// execute http get request
        session.get(path, with: nil) {
            /// once request response
            RESTResult in
            /// switch between result cases
            switch(RESTResult) {
             
            /// when result fails
            case .failure(let error) : do {
                result(.failure(error))
                 }
            /// when result success
            case .success(let response) : do {
                do {
                    let object = try self.session.decoder.decode([GHOrganizationEntity].self, from: response.data)
                    result(.success(object))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
            }
                
            }
         }

    }
    
    func single                 (login      : String,
                                 result     : @escaping OrganizationRepo.ResultOrg) {
        ///orgs/:org
        /// initialize local variables
        var path : String = GHOrganizationRepository.pathOrgs
        path += "/\(login)"
        
        session.get(path, with: nil) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                
                do {
                    
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                    
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                
                
                }
                
            }
            
        }
        
    }
    
    func update                 (billingEmail                           : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramBillingEmail : billingEmail
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
            
    }
    
    func update                 (company                                : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramCompany : company
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
            }
                
            }
        }
    }
    
    func update                 (email                                  : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramEmail : email
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (location                               : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramLocation : location
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (name                                   : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramName : name
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (description                            : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramDescription : description
            
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (hasOrganizationProjects                : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramHasOrganizationProjects : hasOrganizationProjects
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (hasRepositoryProjects                  : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramHasRepositoryProjects : hasRepositoryProjects
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (defaultRepositoryPermission            : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramDefault_repositoryPermission : defaultRepositoryPermission
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (membersCanCreateRepositories           : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramMembersCanCreateRepositories : membersCanCreateRepositories
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (membersCanCreateInternalRepositories   : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramMembersCanCreate_internalRepositories : membersCanCreateInternalRepositories
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (membersCanCreateCrivateRepositories    : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramMembersCanCreatePrivateRepositories : membersCanCreateCrivateRepositories
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (membersCanCreatePublicRepositories     : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramMembersCanCreatePublicRepositories : membersCanCreatePublicRepositories
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    func update                 (membersAllowedRepositoryCreationType   : String,
                                 in orgLogin                            : String,
                                 result                                 : @escaping ResultOrg){
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramMembersAllowedRepositoryCreationType : membersAllowedRepositoryCreationType
        ]
               
        /// execute http patch request
        session.patch(path, with: params) {
            RESTResult in
            
            switch(RESTResult) {
                
            case .failure(let error)    : do { result(.failure((error))) }
            case .success(let response) : do {
                do {
                    let org = try self.session.decoder.decode(GHOrganizationEntity.self, from: response.data)
                    result(.success(org))
                } catch {
                    result(.failure(GHSession.SessionError.decodingError(message: error.localizedDescription)))
                }
                }
                
            }
        }
    }
    
    
}
