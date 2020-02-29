//
//  UT_GHUserRepo.swift
//
//
//  Created by Francisco Romero on 19/02/20.
//

import              XCTest
@testable import    github_api_v3


final class UT_GHPullRequestRepo: XCTestCase {
    
    static let CLS : String  = "UT_GHPullRequestRepo"
    
    func test0001() {
                
        /// initialize local variables
        let testFunction = "test0001"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.listPullRequest"
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
                    
                    api.pullRequestRepo.listPullRequest (owner: "", repo: "", state: nil, head: nil, base: nil, sort: nil, direction: nil) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
                desc: "GHPullRequestRepo.single"
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
                    
                    api.pullRequestRepo.single(owner: "", repo: "", pullNumber: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
        let testFunction = "test0001"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.create"
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
                    
                    api.pullRequestRepo.create(owner: "", repo: "", title: "", head: "", base: "", body: nil, mainteinerCanModify: nil, draft: nil) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
                desc: "GHPullRequestRepo.update"
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
                    
                    api.pullRequestRepo.update(owner: "", repo: "", pullNumber: 0, title: nil, body: nil, state: nil, base: nil, mainteinerCanModify: nil) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
                desc: "GHPullRequestRepo.filesIn"
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
                    
                    api.pullRequestRepo.filesIn(owner: "", repo: "", pullNumber: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
                
        /// initialize local variables
        let testFunction = "test0006"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.verifyMerged"
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
                    
                    api.pullRequestRepo.verifyMerged(owner: "", repo: "", pullNumber: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0007() {
                
        /// initialize local variables
        let testFunction = "test0007"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.merge"
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
                    
                    api.pullRequestRepo.merge(owner: "", repo: "", pullNumber: 0, title: "", message: "", sha: "", method: nil) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    
    func test0008() {
                
        /// initialize local variables
        let testFunction = "test0008"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviews.listReview"
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
                    
                    api.pullRequestRepo.reviews.listReview(owner: "", repo: "", pullNumber: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0009() {
                
        /// initialize local variables
        let testFunction = "test0009"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviews.single"
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
                    
                    api.pullRequestRepo.reviews.single(owner: "", repo: "", pullNumber: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0010() {
                
        /// initialize local variables
        let testFunction = "test0010"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviews.deletePending"
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
                    
                    api.pullRequestRepo.reviews.deletePending(owner: "", repo: "", pullNumber: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0011() {
                
        /// initialize local variables
        let testFunction = "test0011"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviews.comment"
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
                    
                    api.pullRequestRepo.reviews.comment(owner: "", repo: "", pullNumber: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0012() {
                
        /// initialize local variables
        let testFunction = "test0012"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviews.create"
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
                    
                    api.pullRequestRepo.reviews.create(owner: "", repo: "", pullNumber: 0, body: "") {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0013() {
                
        /// initialize local variables
        let testFunction = "test0012"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviews.update"
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
                    
                    api.pullRequestRepo.reviews.update(owner: "", repo: "", pullNumber: 0, reviewId: 0, body: "") {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
        
    func test0014() {
                
        /// initialize local variables
        let testFunction = "test0014"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviews.submit"
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
                    
                    api.pullRequestRepo.reviews.submit(owner: "", repo: "", pullNumber: 0, reviewId: 0, body: "", event: .approve) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
        
    func test0015() {
                
        /// initialize local variables
        let testFunction = "test0015"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviews.dismiss"
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
                    
                    api.pullRequestRepo.reviews.dismiss(owner: "", repo: "", pullNumber: 0, reviewId: 0, message: "") {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    
    func test0016() {
                
        /// initialize local variables
        let testFunction = "test0016"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviewComments.listInPullRequest"
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
                    
                    api.pullRequestRepo.reviewComments.listInPullRequest(owner: "", repo: "", pullNumber: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
        
    func test0017() {
                
        /// initialize local variables
        let testFunction = "test0017"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviewComments.listInRepo"
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
                    
                    api.pullRequestRepo.reviewComments.listInRepo(owner: "", repo: "") {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0018() {
                
        /// initialize local variables
        let testFunction = "test0016"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviewComments.single"
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
                    
                    api.pullRequestRepo.reviewComments.single(owner: "", repo: "", commentId: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0019() {
                
        /// initialize local variables
        let testFunction = "test0019"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviewComments.create"
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
                    
                    api.pullRequestRepo.reviewComments.create(owner: "", repo: "", pullNumber: 0, body: "", path: "") {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0020() {
                
        /// initialize local variables
        let testFunction = "test00206"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviewComments.createReplayFor"
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
                    
                    api.pullRequestRepo.reviewComments.createReplayFor(owner: "", repo: "", pullNumber: 0, commentId: 0, body: "") {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0021() {
                
        /// initialize local variables
        let testFunction = "test0021"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviewComments.update"
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
                    
                    api.pullRequestRepo.reviewComments.update(owner: "", repo: "", commitId: 0, body: "") {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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
    
    func test0022() {
                
        /// initialize local variables
        let testFunction = "test0022"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHPullRequestRepo.reviewComments.delete"
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
                    
                    api.pullRequestRepo.reviewComments.delete(owner: "", repo: "", commitId: 0) {
                        result in
                        
                        switch (result) {
                            
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
                            
                        case .success(let user) :
                            do {
                                                                                                
                                XCTAssertNotNil(user)
                                
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








