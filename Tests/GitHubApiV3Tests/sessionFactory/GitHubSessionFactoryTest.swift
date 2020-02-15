//
//  File.swift
//  
//
//  Created by Francisco Romero on 15/02/20.
//

import XCTest
@testable import github_api_v3


final class GitHubSessionFactoryTest: XCTestCase {
    
    func validTokenSession() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual("Hello, World!", "Hello, Worldklsdjfsld!")
        
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            result in
            
            switch(result) {
            case .failure(let error) :
                do {
                    XCTFail("\(error)")
                }
                
            case .success( _) :
                do {
                    XCTAssertTrue(true)
                }
            }
            
        }
        
    }

    
    func invalidTokenSession() {
        
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.invalid.rawValue) {
            result in
            
            switch(result) {
            case .failure(let error) :
                do {
                    XCTFail("\(error)")
                }
                
            case .success(_) :
                do {
                    XCTAssertTrue(true)
                }
            }
            
        }
    }

    static var allTests = [
        //("validTokenSession"    ,validTokenSession  ),
        ("invalidTokenSession"  ,invalidTokenSession)
    ]
}

