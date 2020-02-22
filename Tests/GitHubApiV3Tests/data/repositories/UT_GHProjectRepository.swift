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
    static var projectCreated = 0
    
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
                                
                            }
                            
                        }
                        expect.fulfill()
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
    
    
    func test0002() {
                
        /// initialize local variables
        let testFunction = "test0002"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHProjectRepo.projectListOf username"
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
                    
                    api.projectRepo.projectListOf(username: "pelusoBuendia01") {
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
                            }
                            
                        }
                        expect.fulfill()
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
    
    
    func test0003() {
                
        /// initialize local variables
        let testFunction = "test0003"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHProjectRepo.projectListOf organization"
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
                    
                    api.projectRepo.projectListOf(organization: "airbnb") {
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
                                
                            }
                            
                        }
                        expect.fulfill()
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
    
    
    func test0004() {
                
        /// initialize local variables
        let testFunction = "test0004"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHProjectRepo.createProject"
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
                    
                    api.projectRepo.createProject(name: "NEW PROJECT NAME", body: "NEW PROJECT BODY") {
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
                                
                                Self.projectCreated = obj.id
                                
                                XCTAssertNotNil(obj)
                            }
                            
                        }
                        expect.fulfill()
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
    
    
    func test0005() {
                
        /// initialize local variables
        let testFunction = "test0005"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHProjectRepo.getProject"
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
                    
                    api.projectRepo.getProject(id: Self.projectCreated) {
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
                                
                            }
                            
                        }
                        expect.fulfill()
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
    
        
    func test0006() {
                
        /// initialize local variables6
        let testFunction = "test000"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHProjectRepo.deleteProject"
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
                    
                    api.projectRepo.deleteProject(id: Self.projectCreated) {
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
                            }                            
                        }
                        expect.fulfill()
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
