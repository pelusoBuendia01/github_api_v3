//
//  UT_GitHubSessionFactory.swift
//
//
//  Created by Francisco Romero on 19/02/20.
//

import              XCTest
@testable import    github_api_v3



final class UT_GitHubSessionFactory: XCTestCase {
    
    static let CLS : String  = "UT_GitHubSessionFactory"
    
    func test0001() {
        
        
        /// initialize local variables
        let testFunction = "test0001"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "initSessionWithToken: valid credentias"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            result in
                
            switch (result) {
                
            case .failure(_)    :
                do {
                    XCTAssert(false)
                }
                
            case .success(_)    :
                do {
                    XCTAssert(true)
                }
                            
            }

            expect.fulfill()
            
        }
        
        
            
        /// wait for expectation timeout
        waitForExpectations(timeout: TestUtils.timeOut) {
            timeOutError in
            
            
            if let timeOutError = timeOutError {
                XCTFail(
                    TestUtils.errorString(
                        cls: Self.CLS,
                        fun: testFunction,
                        error: timeOutError
                    )
                )
            }
        }
        
    }
    
    
    func test0002() {
        
        
        /// initialize local variables
        let testFunction = "test0002"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "initSessionWithToken: invalid credentias"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.invalid.rawValue) {
            result in
                
            switch (result) {
                
            case .failure(_)    :
                do {
                    XCTAssert(true)
                }
                
            case .success(_)    :
                do {
                    print(TestUtils.errorString(
                        cls: Self.CLS,
                        fun: testFunction,
                        error: nil )
                    )
                    XCTAssert(false)
                }
                            
            }

            expect.fulfill()
            
        }
                
        waitForExpectations(timeout: TestUtils.timeOut) {
            timeOutError in
            
            if let timeOutError = timeOutError {
                XCTFail(
                    TestUtils.errorString(
                        cls: Self.CLS,
                        fun: testFunction,
                        error: timeOutError
                    )
                )
            }
        }
    }

    
    
    
}


