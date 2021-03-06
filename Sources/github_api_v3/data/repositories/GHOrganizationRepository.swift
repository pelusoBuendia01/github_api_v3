//
//  GHOrganizationRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 02/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

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
    
    public var session      : GHSession
    
    let blocks              : OrganizationBlocksRepo
    let members             : OrganizationMembersRepo
    let outsideCollaborators: OrganizationOutsideCollaboratorsRepo
    let webhooks            : OrganizationWebhooksRepo
    
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    init(session : GHSession) {
        
        /// initialize instance variables
        self.session                = session
        self.blocks                 = GHOrganizationBlocksRepo              (session: self.session)
        self.members                = GHOrganizationMembersRepo             (session: self.session)
        self.outsideCollaborators   = GHOrganizationOutsideCollaboratorsRepo(session: self.session)
        self.webhooks               = GHOrganizationWebhooksRepo            (session: self.session)
        
    }
    
    
    // MARK: OVERRIDE FUNCTIONS FROM [OrganizationRepository]
    //__________________________________________________________________________________________________________________
    
    func listOAuthOrganizations (result: @escaping OrganizationRepo.ResultOrgList) {
        
        /// initialize local variables
        var path : String = GHUserRepo.pathAuthenticated
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
        var path : String = GHUserRepo.pathUsers
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
        
    func update                 (hasOrganizationProjects    : Bool,
                                 in orgLogin    : String,
                                 result         : @escaping ResultOrg) {
        
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
    
    func update                 (hasRepositoryProjects: Bool,
                                 in orgLogin    : String,
                                 result         : @escaping ResultOrg) {
        
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
    
    func update                 (defaultRepositoryPermission: OrganizationRepositoryPermission,
                                 in orgLogin    : String,
                                 result         : @escaping ResultOrg) {
        
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path            += "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramDefault_repositoryPermission : defaultRepositoryPermission.rawValue
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
    
    func update                 (membersCanCreateRepositories: Bool,
                                 in orgLogin    : String,
                                 result         : @escaping ResultOrg) {
        
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
    
    
    func update                 (membersCanCreateInternalRepositories: Bool,
                                 in orgLogin    : String,
                                 result         : @escaping ResultOrg) {
        
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
        
    func update                 (membersCanCreatePrivateRepositories: Bool,
                                 in orgLogin    : String,
                                 result         : @escaping ResultOrg) {
        
        /// initialize local variables
        var path : String    = GHOrganizationRepository.pathOrgs
            path                +=  "/\(orgLogin)"
               
        let params : [String:Any?] = [
            GHOrganizationRepository.paramMembersCanCreatePrivateRepositories : membersCanCreatePrivateRepositories
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
    
    func update                 (membersCanCreatePublicRepositories: Bool,
                                 in orgLogin    : String,
                                 result         : @escaping ResultOrg) {
        
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
    
    func update                 (membersAllowedRepositoryCreationType: OrganizationMembersAllowedRepositoryCreationType,
                                 in orgLogin    : String,
                                 result         : @escaping ResultOrg) {
    
    /// initialize local variables
    var path : String    = GHOrganizationRepository.pathOrgs
        path                +=  "/\(orgLogin)"
            
    let params : [String:Any?] = [
        GHOrganizationRepository.paramMembersAllowedRepositoryCreationType : membersAllowedRepositoryCreationType.rawValue
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


class GHOrganizationBlocksRepo: OrganizationBlocksRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    static let pathBlocks   : String = "/blocks "
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
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

    func listBlockedUsers   (result     : @escaping UserRepo.ResultUserList) {
                    
        /// initialize local variables
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationBlocksRepo.listBlockedUsers : 🚧 not implemented")))
        
    }
    
    func verify             (username   : String,
                             result     : @escaping GHConfiguration.RESTConfirmation) {
    
        /// initialize local variables
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationBlocksRepo.verify : 🚧 not implemented")))
        
    }
    
    func block              (username   : String,
                             result     : @escaping GHConfiguration.RESTConfirmation) {
    
        /// initialize local variables
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationBlocksRepo.block : 🚧 not implemented")))
        
    }
    
    func unblock            (username   : String,
                             result     : @escaping GHConfiguration.RESTConfirmation) {
        
        /// initialize local variables
        
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationBlocksRepo.unblock : 🚧 not implemented")))
        
    }
    
    
}

class GHOrganizationMembersRepo: OrganizationMembersRepo {
 
  
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
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
    
    func memberList                 (organization   : String,
                                     role           : OrganizationRole?,
                                     filter         : OrganizationFilter?,
                                     result         : @escaping UserRepo.ResultUserList ) {
            
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.memberList : 🚧 not implemented")))
    }
    
    
    func verifyMembership           (of username    : String,
                                     in orgName     : String,
                                     result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.verifyMembership : 🚧 not implemented")))
    }
    
    
    func addMember                  (of username    : String,
                                     in orgName     : String,
                                     result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.addMember : 🚧 not implemented")))
    }
    
    func publicMemberList           (organization   : String,
                                     result         : @escaping (Result<[UserEntity], Error>) -> Void) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.publicMemberList : 🚧 not implemented")))
    }
    
    func verifyPublicMembership     (of username    : String,
                                     in orgName     : String,
                                     result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.verifyPublicMembership : 🚧 not implemented")))
    }
    
    func publicizeUserMembership    (of username    : String,
                                     in orgName     : String,
                                     result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.publicizeUserMembership : 🚧 not implemented")))
    }
    
    func concealUserMembership      (of username    : String,
                                     in orgName     : String,
                                     result         : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.concealUserMembership : 🚧 not implemented")))
    }
    
    func getMembership              (of username    : String,
                                     in orgName     : String,
                                     result         : @escaping ResultMembership) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.getMembership : 🚧 not implemented")))
    }
    
    func addMembership              (of username    : String,
                                     in orgName     : String,
                                     role           : OrganizationRole?,
                                     result         : @escaping ResultMembership) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.addMembership : 🚧 not implemented")))
    }
    
    func removeMembership           (of username    : String,
                                     in orgName     : String,
                                     role           : OrganizationRole?,
                                     result         : @escaping ResultMembership) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.removeMembership : 🚧 not implemented")))
    }
    
    func lisInvitationTeams         (invitationID   : String,
                                     in orgName     : String,
                                     result         : @escaping ResultInvitationList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.lisInvitationTeams : 🚧 not implemented")))
    }
    
    func listPendingInvitationTeams (invitationID   : String,
                                     in orgName     : String,
                                     result         : @escaping ResultInvitationList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.listPendingInvitationTeams : 🚧 not implemented")))
    }
    
    func createInvitation           (email          : String,
                                     in orgName     : String,
                                     result         : @escaping ResultInvitationList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.createInvitation : 🚧 not implemented")))
    }
    
    func createInvitation           (id             : Int,
                                     in orgName     : String,
                                     role           : OrganizationInvitationRole?,
                                     result         : @escaping ResultInvitationList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.createInvitation : 🚧 not implemented")))
    }
    
    func myMemberships              (result         : @escaping ResultMembershipList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.myMemberships : 🚧 not implemented")))
    }
    
    func myMemberships              (in orgName     : String,
                                     result         : @escaping ResultMembership) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationMembersRepo.myMemberships : 🚧 not implemented")))
    }
    
}



class GHOrganizationOutsideCollaboratorsRepo: OrganizationOutsideCollaboratorsRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
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
    
    
    func listOutsideCollaborators           (result     : @escaping ResultCollaboratorList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationOutsideCollaboratorsRepo.listOutsideCollaborators : 🚧 not implemented")))
    }
    
    func removeCollarborator                (username   : String,
                                             result     : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationOutsideCollaboratorsRepo.removeCollarborator : 🚧 not implemented")))
    }
    
    func convertMemberToOutsideCollaborator (username   : String,
                                             result     : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationOutsideCollaboratorsRepo.convertMemberToOutsideCollaborator : 🚧 not implemented")))
    }
    

}


class GHOrganizationWebhooksRepo: OrganizationWebhooksRepo {
    
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
        
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: PRIVATTE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
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
            
                        
    func listHooks      (result     : @escaping ResultWebhookList) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationWebhooksRepo.listHooks : 🚧 not implemented")))
    }
    
    func single         (orgName    : String,
                         hookId     : Int,
                         result     : @escaping ResultWebhook) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationWebhooksRepo.single : 🚧 not implemented")))
    }
    
    func create         (name       : String,
                         conf       : WebhookConfigEntity?,
                         events     : [String],
                         active     : Bool,
                         result     : @escaping ResultWebhook) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationWebhooksRepo.create : 🚧 not implemented")))
    }
    
    func update         (conf       : WebhookConfigEntity?,
                         events     : [String],
                         active     : Bool,
                         result     : @escaping ResultWebhook) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationWebhooksRepo.update : 🚧 not implemented")))
    }
    
    func ping           (orgName    : String,
                         hookId     : Int,
                         result     : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationWebhooksRepo.ping : 🚧 not implemented")))
    }
    
    func delete         (orgName    : String,
                         hookId     : Int,
                         result     : @escaping GHConfiguration.RESTConfirmation) {
        result(.failure(GHSession.SessionError.notImplemented(message: "GHOrganizationWebhooksRepo.delete : 🚧 not implemented")))
    }

  
}


