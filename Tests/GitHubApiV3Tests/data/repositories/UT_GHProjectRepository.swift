//
//  UT_GHProjectRepository.swift
//
//
//  Created by Francisco Romero on 19/02/20.
//

import              XCTest
@testable import    github_api_v3



final class UT_GHProjectRepository: XCTestCase {
    
    static let CLS : String  = "UT_GHMiscellaneousRepo"
    
    func test0001() {
                
        /// initialize local variables
        let testFunction = "test0001"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHProjectRepo."
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            sessionResult in
                                    
            switch(sessionResult) {
            case .failure(let error) :
                do {
                    
                    XCTFail(
                        TestUtils.errorString(
                            cls: Self.CLS,
                            fun: testFunction,
                            error: error
                        )
                    )
                        
                }
            case .success(let api) :
                do {
                    
                    api.projectRepo.myProjects() {
                        result in
                        
                        switch(result) {
                            
                        case .failure(let error) :
                            do {
                                XCTFail(
                                    TestUtils.errorString(
                                        cls: Self.CLS,
                                        fun: testFunction,
                                        error: error
                                    )
                                )
                            }
                            
                        case .success(let obj) :
                            do {
                                XCTAssertNotNil(obj)
                                expect.fulfill()
                            }
                            
                        }
                        
                    }
                }
            }
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
    
    
    
}
