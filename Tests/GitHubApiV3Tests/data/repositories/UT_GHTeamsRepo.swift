//
//  UT_GHTeamsRepo.swift
//
//
//  Created by Francisco Romero on 19/02/20.
//

import              XCTest
@testable import    github_api_v3


final class UT_GHTeamsRepo: XCTestCase {
    
    static let CLS : String  = "UT_GHTeamsRepo"
    
    func test0001() {
                
        /// initialize local variables
        let testFunction = "test0001"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo."
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
                    
                    api.teamRepo.listTeams() {
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
                desc: "GHTeamsRepo.getBy"
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
                    
                    api.teamRepo.getBy(name: "") {
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
                desc: "GHTeamsRepo.create"
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
                    
                    api.teamRepo.create(name: "",
                                        description: "",
                                        mainteiners: nil,
                                        repoNames: nil,
                                        privacy: nil,
                                        permission: nil,
                                        parentTeamId: nil) {
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
                desc: "GHTeamsRepo.update"
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
                    
                    api.teamRepo.update(slug    : "",
                                        in      : 0,
                                        name    : "",
                                        description: nil,
                                        privacy: nil,
                                        permission: nil,
                                        parentTeamId: nil) {
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
            
    func test0005() {
                    
        /// initialize local variables
        let testFunction = "test0005"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.delete"
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
                    
                    api.teamRepo.delete(slug: "", in: 0) {
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
                    
        /// initialize local variables
        let testFunction = "test0006"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.childTeams"
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
                    
                    api.teamRepo.childTeams(slug: "", in: 0) {
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
            
    func test0007() {
                    
        /// initialize local variables
        let testFunction = "test0007"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.reposOf"
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
                    
                    api.teamRepo.reposOf(slug: "", in: 0) {
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
            
    func test0008() {
                    
        /// initialize local variables
        let testFunction = "test0009"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.verifyRepo"
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
                    
                    api.teamRepo.verifyRepo(owner: "", repo: "", managedBy: "", in: 0) {
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
 
    func test0009() {
                    
        /// initialize local variables
        let testFunction = "test0009"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.addOrupdateRepo"
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
                    
                    api.teamRepo.addOrupdateRepo(owner: "", repo: "", managedBy: "", in: 0) {
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
        
    func test0010() {
                    
        /// initialize local variables
        let testFunction = "test0010"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.removeRepo"
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
                    
                    api.teamRepo.removeRepo(owner: "", repo: "", managedBy: "", in: 0) {
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
        
    func test0011() {
                    
        /// initialize local variables
        let testFunction = "test0011"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.authorizedTeams"
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
                    
                    api.teamRepo.authorizedTeams() {
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
        
    func test0012() {
                    
        /// initialize local variables
        let testFunction = "test0012"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.projects"
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
                    
                    api.teamRepo.projects(in: "", org: 0) {
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
        
    func test0013() {
                    
        /// initialize local variables
        let testFunction = "test0012"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusions.listDiscussions"
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
                    
                    api.teamRepo.discussion.listDiscussions(in: "", orgId: 0, team_Id: 0) {
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
    
    func test0014() {
                    
        /// initialize local variables
        let testFunction = "test0012"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusions.single"
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
                    
                    api.teamRepo.discussion.single(discussionNumber: 0, in: "", orgId: 0, team_Id: 0) {
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
    
    func test0015() {
                    
        /// initialize local variables
        let testFunction = "test0012"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusions.create"
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
                    
                    api.teamRepo.discussion.create(title: 0, required: 0, isPrivate: false, orgId: 0, team_Id: 0){
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
    
    func test0016() {
                    
        /// initialize local variables
        let testFunction = "test0012"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusions.update"
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
                    
                    api.teamRepo.discussion.update(discussionNumber: 0, title: nil, required: nil, isPrivate: nil, orgId: 0, team_Id: 0){
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

    func test0017() {
                    
        /// initialize local variables
        let testFunction = "test0017"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusions.delete"
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
                    
                    api.teamRepo.discussion.delete(discussionNumber: 0, in: "", orgId: 0) {
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
    
    func test0018() {
                    
        /// initialize local variables
        let testFunction = "test0018"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusionsComments.listComments"
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
                    
                    api.teamRepo.discussionComments.listComments() {
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
    
    func test0019() {
                    
        /// initialize local variables
        let testFunction = "test0019"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusionsComments.single"
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
                    
                    api.teamRepo.discussionComments.single(commentNumber: 0, disussionNumber: 0, slug: "", org: "") {
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
    
    func test0020() {
                    
        /// initialize local variables
        let testFunction = "test0020"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusionsComments.create"
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
                    
                    api.teamRepo.discussionComments.create(body: "", disussionNumber: 0, slug: "", org: "") {
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
    
    func test0021() {
                    
        /// initialize local variables
        let testFunction = "test0021"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusionsComments.edit"
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
                    
                    api.teamRepo.discussionComments.edit(body: "", commentNumber: 0, disussionNumber: 0, slug: "", org: "") {
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
    
    func test0022() {
                    
        /// initialize local variables
        let testFunction = "test0022"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.discusionsComments.delete"
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
                    
                    api.teamRepo.discussionComments.delete(commentNumber: 0, disussionNumber: 0, slug: "", org: "") {
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
    
    
    func test0023() {
                    
        /// initialize local variables
        let testFunction = "test0023"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.members.listMembers"
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
                    
                    api.teamRepo.members.listMembers(orgId: 0, teamId: 0, role: nil) {
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
    
    func test0024() {
                    
        /// initialize local variables
        let testFunction = "test0024"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.members.getMembership"
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
                    
                    api.teamRepo.members.getMembership(orgId: 0, teamId: 0, username: "") {
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
    
    func test0025() {
                    
        /// initialize local variables
        let testFunction = "test0025"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.members.addOrUpdateMembership"
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
                    
                    api.teamRepo.members.addOrUpdateMembership(username: "", orgId: 0, teamId: 0) {
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
    
    func test0026() {
                    
        /// initialize local variables
        let testFunction = "test0026"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.members.removeMembership"
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
                    
                    api.teamRepo.members.removeMembership(username: "", orgId: 0, teamId: 0) {
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
    
    func test0027() {
                    
        /// initialize local variables
        let testFunction = "test0027"
        let expect = expectation(
            description: TestUtils.expectationString(
                cls: Self.CLS,
                fun: testFunction,
                desc: "GHTeamsRepo.members.listPendingInvitations"
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
                    
                    api.teamRepo.members.listPendingInvitations(orgId: 0, teamId: 0) {
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


