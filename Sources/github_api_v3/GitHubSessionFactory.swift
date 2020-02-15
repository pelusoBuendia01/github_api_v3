//
//  File.swift
//  
//
//  Created by Francisco Romero on 14/02/20.
//

import Foundation

public class GitHubSessionFactory {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultApi         = (Result< GithubAPI    ,Error> ) -> Void
    
    
    // MARK: PRIVATE CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    private init() {
        
    }
    
    
    // MARK: PUBLIC STATIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    static func initSessionWithToken(
        token   : String ,
        result  : @escaping ResultApi
    ) -> Void  {
        
        // initi local variables
        let tmpSession = GHSession.login(
            with    : token,
            username: ""
        )
        let tmpAPI = GHGithubAPI(
            session : tmpSession
        )
        
        /// get authenticated user
        tmpAPI.userRepo.authenticated() {
            userResult in
            
            /// swith the user result
            switch (userResult) {
                
            /// When  result fails
            case .failure(let error) :
                do {
                    result( .failure(error) )
                }
                
            /// When result success
            case .success(let user) :
                do {
                    
                    /// initialize session for result api
                    let session = GHSession.login(
                        with    : token,
                        username: user.login
                    )
                    
                    /// initialize API instance
                    let API = GHGithubAPI(session: session)
                    
                    /// result success
                    result(.success(API))
                    
                }
            }
        }
            
        
    }
    
    
    
}
