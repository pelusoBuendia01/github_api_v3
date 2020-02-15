//
//  GHUserRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 11/01/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//  TECH REFERENCE : https://developer.github.com/v3/users/
//

import Foundation

public protocol UserRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultUser        = (Result< UserEntity   ,Error>)  -> Void
    typealias ResultUserList    = (Result<[UserEntity]  ,Error>)  -> Void
    
    // MARK: AUTHENTICATED FUNCTIONS
    //__________________________________________________________________________________________________________________
    func authenticated  (result     : @escaping ResultUser) -> Void
    
    func updateName     (_ name     : String?,
                         result : @escaping ResultUser) -> Void
    
    func updateEmail    (_ email    : String?,
                         result     : @escaping ResultUser ) -> Void
    
    func updateBlog     (_ blog     : String?,
                         result     : @escaping ResultUser) -> Void
    
    func updateCompany  (_ company  : String?,
                         result     : @escaping ResultUser ) -> Void
    
    func updateLocation (_ location : String?,
                        result      : @escaping ResultUser ) -> Void
    
    func updateHireable (_ hireable : Bool?,
                        result      : @escaping ResultUser) -> Void
    
    func updateBio      (_ bio      : String?,
                        result      : @escaping ResultUser ) -> Void
    
    // MARK: SINGLE USER FUNCTIONS
    //__________________________________________________________________________________________________________________
    func single         (from username: GHConfiguration.Username,
                        result      : @escaping ResultUser ) -> Void
    //func singleHovercard(from username: GHConfiguration.Username) -> Void // TODO: 🏷 Setup hovercard api
    
    // MARK: MULTIPLE USERS FUNCTIONS
    //__________________________________________________________________________________________________________________
    func list           (starting since: GHConfiguration.ID?,
                        result     : @escaping ResultUserList ) -> Void
    
    // MARK: BLOCKING USERS FUNCTIONS
    //__________________________________________________________________________________________________________________
    func blockedUsers   (result     : @escaping ResultUserList ) -> Void
    
    func verifyIf       (isBlocked username: GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation) -> Void
    
    func block          (username   : GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation ) -> Void
    
    func unblock        (username   : GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation ) -> Void
    
}
