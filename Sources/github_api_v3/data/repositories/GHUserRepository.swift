//
//  GHUserRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 11/01/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation


internal class GHUserRepository: UserRepo {
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    private static let paramName            : String = "name"
    private static let paramEmail           : String = "email"
    private static let paramBlog            : String = "blog"
    private static let paramCompany         : String = "company"
    private static let paramLocation        : String = "location"
    private static let paramHireable        : String = "hireable"
    private static let paramBio             : String = "bio"
    private static let paramSince           : String = "since"
    private static let pathBlocks           : String = "/blocks"
    
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    static let pathUsers            : String = "/users"
    static let pathAuthenticated    : String = "/user"    
    
    // MARK: OVERRIDED PUBLIC PROPERTIES [UserRepository]
    //__________________________________________________________________________________________________________________
    public var session: GHSession
    
    // MARK: CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    public init(session : GHSession) {
        self.session = session
    }
    
    
    // MARK: OVERRIDED PUBLIC FUNCTIONS [UserRepository]
    //__________________________________________________________________________________________________________________
    //  TECH REFERENCE : https://developer.github.com/v3/users/
    
    public func authenticated  (result     : @escaping ResultUser) {
        /// Initialize local variables
        let path = "/user"
        
        session.get(path, with: nil) {
            RESTtResult in
            switch (RESTtResult) {
            case .failure(let error) : do {
                result(.failure(error))
                }
            case .success(let response) : do {
                
                do {
                    let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                    result(.success((user)))
                }
                catch {
                    
                }
                
                
                }
            }
        }
    }
    
    public func updateName     (_ name     : String?,
                                result     : @escaping ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepository.paramName: name
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepository.pathAuthenticated ,
                with        : params ) {
                    RESTResult in
                    
                    switch(RESTResult) {
                        
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                    case .success(let response) : do {
                        
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(.success(user))
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        
                        }
                    }
                        
            }
        
                    
    }
    
    public func updateEmail    (_ email    : String?,
                         result     : @escaping UserRepo.ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepository.paramEmail: email
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepository.pathAuthenticated ,
                with        : params                ) {
                RESTResult in
                    
                    switch (RESTResult) {
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                    case .success(let response) : do {
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(
                                .success(user)
                            )
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        }
                    }
        }
    }
        
    public func updateBlog     (_ blog     : String?,
                         result     : @escaping UserRepo.ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepository.paramBlog: blog
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepository.pathAuthenticated ,
                with        : params ) {
                RESTResult in
                    
                    switch (RESTResult) {
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                    case .success(let response) : do {
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(
                                .success(user)
                            )
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        }
                    }
                    
        }
    }
    
    public func updateCompany  (_ company  : String?,
                         result     : @escaping UserRepo.ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepository.paramCompany: company
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepository.pathAuthenticated ,
                with        : params) {
                    RESTResult in
                    
                    switch (RESTResult) {
                        
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                        
                    case .success(let response) : do {
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(
                                .success(user)
                            )
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        }
                        
                    }
        }
    }
    
    public func updateLocation (_ location : String?,
                         result     : @escaping UserRepo.ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepository.paramLocation: location
        ]
        
        session.patch(
            GHUserRepository.pathAuthenticated,
            with: params ) {
            RESTResult in
            
            switch (RESTResult) {
                
            case .failure(let error) : do {
                result(.failure(error))
                }
                
            case .success(let response) : do {
                do {
                    let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                    result(
                        .success(user)
                    )
                }
                catch {
                    result(
                        .failure(
                            GHSession.SessionError.decodingError(
                                message: error.localizedDescription
                            )
                        )
                    )
                }
                }
                
            }
        }
    }
    
    public func updateHireable (_ hireable : Bool?,
                         result     : @escaping UserRepo.ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepository.paramHireable: hireable
        ]
        
        /// Get path from session
        session.patch(
            GHUserRepository.pathAuthenticated ,
            with        : params ) {
                RESTResult in
                
                switch (RESTResult) {
                    
                case .failure(let error) : do {
                    result(.failure(error))
                    }
                    
                case .success(let response) : do {
                    do {
                        let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                        result(
                            .success(user)
                        )
                    }
                    catch {
                        result(
                            .failure(
                                GHSession.SessionError.decodingError(
                                    message: error.localizedDescription
                                )
                            )
                        )
                    }
                    }
                    
                }
        }
    }
    
    public func updateBio      (_ bio      : String?,
                         result     : @escaping UserRepo.ResultUser) {
        
        /// Initialize local variables
        let params : [String:Any?] = [
            GHUserRepository.paramBio: bio
        ]
        
        /// Get path from session
        session
            .patch(
                GHUserRepository.pathAuthenticated,
                with        : params ) {
                    RESTResult in
                    
                    switch (RESTResult) {
                        
                    case .failure(let error) : do {
                        result(.failure(error))
                        }
                        
                    case .success(let response) : do {
                        do {
                            let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                            result(
                                .success(user)
                            )
                        }
                        catch {
                            result(
                                .failure(
                                    GHSession.SessionError.decodingError(
                                        message: error.localizedDescription
                                    )
                                )
                            )
                        }
                        }
                    }
        }
    }
    
    public func single         (from username: GHConfiguration.Username,
                         result     : @escaping UserRepo.ResultUser) {
        /// Initialize local variables
        let path = "\(GHUserRepository.pathUsers)/\(username)"
        
        /// Get path from session
        session.get(
            path,
            with        : nil )  {
               RESTResult in
               
               switch (RESTResult) {
                   
               case .failure(let error) : do {
                   result(.failure(error))
                   }
                   
               case .success(let response) : do {
                   do {
                       let user = try self.session.decoder.decode(GHUserEntity.self, from: response.data)
                       result(
                           .success(user)
                       )
                   }
                   catch {
                       result(
                           .failure(
                               GHSession.SessionError.decodingError(
                                   message: error.localizedDescription
                               )
                           )
                       )
                   }
                   }
               }
        }
    }
    
    public func list           (starting since: GHConfiguration.ID?,
                         result     : @escaping UserRepo.ResultUserList) {
        /// Initialize local variables
        let path : String
        
        /// Determine what parameters to use
        if let since = since {
            path = "\(GHUserRepository.pathUsers)?\(GHUserRepository.paramSince)=\(since)"
        } else {
            path = GHUserRepository.pathUsers
        }
         
        /// Get path from session
        session
            .get(
                path,
                with        : nil )  {
                   RESTResult in
                   
                   switch (RESTResult) {
                       
                   case .failure(let error) : do {
                       result(.failure(error))
                       }
                       
                   case .success(let response) : do {
                       do {
                           let users = try self.session.decoder.decode([GHUserEntity].self, from: response.data)
                           result(
                               .success(users)
                           )
                       }
                       catch {
                           result(
                               .failure(
                                   GHSession.SessionError.decodingError(
                                       message: error.localizedDescription
                                   )
                               )
                           )
                       }
                       }
                   }
            }
    }
    
        
    
    // MARK: BLOCKING FUNCTION
    //__________________________________________________________________________________________________________________
    
    //  TECH REFERENCE : https://developer.github.com/v3/users/blocking/    
    
    public func blockedUsers   (result: @escaping UserRepo.ResultUserList) {
        /// Get path from session
        session
            .get(
                "\(GHUserRepository.pathAuthenticated)\(GHUserRepository.pathBlocks)",
                with        : nil ) {
                    RESTResult in
                    
                    switch (RESTResult) {
                    case .failure(let error): do {
                        result(.failure(error))
                        }
                    case .success(let response) : do {
                        
                        do {
                            let users = try self.session.decoder.decode([GHUserEntity].self, from: response.data)
                            result(
                                .success(
                                    users
                                )
                            )
                        }
                        catch {
                            
                            result(.failure(
                                GHSession.SessionError.decodingError(
                                    message: error.localizedDescription
                                )
                            ))
                        }
                        
                        
                        }
                    }
        }
    }
    
    public func verifyIf       (isBlocked username: GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation) {
        
        /// Initialize local variables
       let path : String = "\(GHUserRepository.pathAuthenticated)\(GHUserRepository.pathBlocks)/\(username)"
       
       /// Determine what parameters to use
        session
            .get(path,
                 with: nil ) {
                RESTResult in
                
                switch(RESTResult){

                case .failure( _ ) : do {
                    result(.success(false))
                    }
                    
                case .success( _ ) : do {
                    result(.success(true))
                    }
                    
                }
        }
    }
    
    public func block          (username   : GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation) {
        
        /// Initialize local variables
        let path : String = "\(GHUserRepository.pathAuthenticated)\(GHUserRepository.pathBlocks)/\(username)"
          
        /// Determine what parameters to use
        session
            .put(path,
                with: nil ) {
                RESTResult in
                   
                switch(RESTResult){
                   
                case .failure( _ ) : do {
                    result(.success(false))
                    }
                       
                case .success( _ ) : do {
                    result(.success(true))
                    }
                       
                }
           }
    }
    
    public func unblock        (username   : GHConfiguration.Username,
                         result     : @escaping GHConfiguration.RESTConfirmation) {
                             
        /// Initialize local variables
        let path : String = "\(GHUserRepository.pathAuthenticated)\(GHUserRepository.pathBlocks)/\(username)"
        
        /// Determine what parameters to use
        session
            .delete(path,
                with: nil ) {
                RESTResult in
                
                switch(RESTResult){
                    
                case .failure( _ ) : do {
                    result(.success(false))
                    }
                        
                case .success( _ ) : do {
                    result(.success(true))
                    }
                    
                }
            }
        
    }
            
}
