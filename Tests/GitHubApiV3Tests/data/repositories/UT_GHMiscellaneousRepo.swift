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
                desc: "GHMiscellaneousEmojisRepo.getEmojiList"
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
                    
                    
                    api
                        .miscellaneousRepo
                        .emojis
                        .getEmojiList() {
                            result in

                            /// 🔬 Execute test
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
                                                
                            case .success(_) :
                            
                                do {
                                    
                                    XCTAssert(true)
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
    
    func test0002() {
        
        /// initialize local variables
        let testFunction = "test0002"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousGitIgnoresRepo.gitIgnoreNames"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.gitIgnores.gitIgnoreNames() {
                        result in
                                            
                        /// 🔬 Execute test
                        switch( result ) {

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
                            
                        case .success(_) :
                            do  {
                                XCTAssert(true)
                                expect.fulfill()
                            }
                        }
                        
                    }
                    
                    
                }
                
            }
            
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

    func test0003() {
        
        /// initialize local variables
        let testFunction = "test0003"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousGitIgnoresRepo.gitIgnoreTemplate"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.gitIgnores.gitIgnoreTemplate(name: "C") {
                        result  in
                        
                        /// 🔬 Execute test
                        switch( result ) {
                            
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
                            
                        case .success(_) :
                            do  {
                                
                                XCTAssert(true)
                                expect.fulfill()
                            }
                        }
                        
                    }
                    
                    
                }
                
            }
            
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

    func test0004() {
        
        /// initialize local variables
        let testFunction = "test0004"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousLicensesRepo.licenseList"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.licenses.licenseList() {
                        result in
                        
                        /// 🔬 Execute test
                        switch( result ) {
                            
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
                            
                        case .success(_) :
                            do  {
                                
                                XCTAssert(true)
                                expect.fulfill()
                            }
                        }
                        
                    }
                    
                }
                
            }
            
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

    func test0005() {
        
        /// initialize local variables
        let testFunction = "test0005"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousLicensesRepo.single"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.licenses.single(name: "mit") {
                        result in
                        
                        /// 🔬 Execute test
                        switch( result ) {
                            
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
                            
                        case .success(_) :
                            do  {
                                XCTAssert(true)
                                expect.fulfill()
                            }
                        }
                        
                    }
                        
                    
                }
                
            }
            
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
    
    func test0006() {
        
        /// initialize local variables
        let testFunction = "test0006"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousLicensesRepo.licenseIn"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.licenses.licenseIn(owner: "exceljs", repo: "exceljs") {
                        result in
                        
                        /// 🔬 Execute test
                        switch( result ) {
                            
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
                            
                        case .success(_) :
                            do  {
                                XCTAssert(true)
                                expect.fulfill()
                            }
                        }
                        
                    }
                    
                }
                
            }
            
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

    func test0007() {
        
        /// initialize local variables
        let testFunction = "test0007"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousMarkdownRepo.renderMarkdown"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.markdown.renderMarkdown(text: "Hello world github/linguist#1 **cool**, and #1!") {
                        result in
                        
                        /// 🔬 Execute test
                        switch( result ) {
                            
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
                            
                        case .success(let html) :
                            do  {
                                
                                XCTAssertNotNil(html)
                                XCTAssert(true)
                                
                            }
                        }
                        expect.fulfill()
                    }
                                        
                }
                
            }
            
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

    func test0008() {
        
        /// initialize local variables
        let testFunction = "test0008"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousMarkdownRepo.renderMarkdownRaw"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.markdown.renderMarkdownRaw(text: "Hello world github/linguist#1 **cool**, and #1!") {
                        result in
                        
                        /// 🔬 Execute test
                        switch( result ) {
                            
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
                            
                        case .success(let html) :
                            do  {
                                                                
                                XCTAssertGreaterThan(html.count, 0)
                                
                            }
                        }
                        expect.fulfill()
                    }
                    
                }
                
            }
            
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
    
    func test0009() {
        
        /// initialize local variables
        let testFunction = "test0009"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousMetaRepo.get"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.meta.get() {
                        result in
                        
                        /// 🔬 Execute test
                        switch( result ) {
                            
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
                            
                        case .success(_) :
                            do  {                                
                                XCTAssert(true)
                                expect.fulfill()
                            }
                        }
                        
                    }
                    
                }
                
            }
            
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
    
    func test0010() {
        
        /// initialize local variables
        let testFunction = "test0010"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "MiscellaneousRateLimitRepo.get"
            )
        )
        
        /// excute async function
        GitHubSessionFactory.initSessionWithToken(token: TestTokens.valid.rawValue) {
            apiResult in
            
            switch ( apiResult ) {
                
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
                    
                    api.miscellaneousRepo.rateLimit.get() {
                        result in
                            
                        /// 🔬 Execute test
                        switch( result ) {
                            
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
                            
                        case .success(_) :
                            do  {
                                XCTAssert(true)
                                expect.fulfill()
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
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


