//
//  UT_GHMiscellaneousRepo.swift
//
//
//  Created by Francisco Romero on 19/02/20.
//

import              XCTest
@testable import    github_api_v3



final class UT_GHMiscellaneousRepo: XCTestCase {
    
    static let CLS : String  = "UT_GHMiscellaneousRepo"
    
    func test0001() {
                
        /// initialize local variables
        let testFunction = "test0001"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "Not yet implemented"
            )
        )
        
        /// excute async function
        expect.fulfill()    // TODO: 🏷 remove this code line once test is implemented & move it to async result block
            
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
                desc: "Not yet implemented"
            )
        )
        
        /// excute async function
        expect.fulfill()    // TODO: 🏷 remove this code line once test is implemented & move it to async result block
        
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


