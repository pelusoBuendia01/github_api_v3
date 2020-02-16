//
//  GHUserRepository.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/users/

import Foundation


public protocol UserRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    
    typealias ResultUser        = (Result< UserEntity   ,Error>)  -> Void
    typealias ResultUserList    = (Result<[UserEntity]  ,Error>)  -> Void
    
    // MARK: AUTHENTICATED FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    /// authenticated
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
    func authenticated  (result     : @escaping ResultUser) -> Void
    
    /// updateName
    ///
    /// - parameter name: the new name to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func updateName     (_ name     : String?,
                         result     : @escaping ResultUser) -> Void
    
    /// updateEmail
    ///
    /// - parameter email: the email to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func updateEmail    (_ email    : String?,
                         result     : @escaping ResultUser ) -> Void
    
    /// updateBlog
    ///
    /// - parameter blog: the blog to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func updateBlog     (_ blog     : String?,
                         result     : @escaping ResultUser) -> Void
    
    /// updateCompany
    ///
    /// - parameter company: the company to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func updateCompany  (_ company  : String?,
                         result     : @escaping ResultUser ) -> Void
    
    /// updateLocation
    ///
    /// - parameter location: the location to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func updateLocation (_ location : String?,
                        result      : @escaping ResultUser ) -> Void
    
    /// updateHireable
    ///
    /// - parameter hireable: the hireable status to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func updateHireable (_ hireable : Bool?,
                        result      : @escaping ResultUser) -> Void
    
    /// updateBio
    ///
    /// - parameter bio: the bio to update
    /// - parameter result: the callback competition
    /// - returns: Void
    func updateBio      (_ bio      : String?,
                        result      : @escaping ResultUser ) -> Void
    
    // MARK: SINGLE USER FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    /// single
    ///
    /// - parameter for_username: the username to find
    /// - parameter result: the callback competition
    /// - returns: Void
    func single         (from username: GHConfiguration.Username,
                        result      : @escaping ResultUser ) -> Void
    //func singleHovercard(from username: GHConfiguration.Username) -> Void // TODO: 🏷 Setup hovercard api
    
    // MARK: MULTIPLE USERS FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    /// list
    ///
    /// - parameter starting_sice: the the  starting id search parameter
    /// - parameter result: the callback competition
    /// - returns: Void
    func list           (starting since: GHConfiguration.ID?,
                        result      : @escaping ResultUserList ) -> Void
    
    // MARK: BLOCKING USERS FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    /// blockedUsers
    ///
    /// - parameter result: the callback competition
    /// - returns: Void
    func blockedUsers   (result     : @escaping ResultUserList ) -> Void
    
    /// verifyIf
    ///
    /// - parameter isBlocked_username: the usewrname to verify
    /// - parameter result: the callback competition
    /// - returns: Void
    func verifyIf       (isBlocked username: GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation) -> Void
    
    /// block
    ///
    /// - parameter username: the usename to block
    /// - parameter result: the callback competition
    func block          (username   : GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation ) -> Void
    
    /// unblock
    ///
    /// - parameter username: the username to unblock
    /// - parameter result: the callback competition
    /// - returns: Void
    func unblock        (username   : GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation ) -> Void
    
}
