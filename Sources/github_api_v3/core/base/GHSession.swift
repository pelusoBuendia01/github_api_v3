//
//  GHSession.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 09/01/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public class GHSession {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum SessionType  {
        case standar
    }
    
    public enum SessionError : Error {
        case responseError  (message: String)
        case requestError   (message: String)
        case decodingError  (message: String)
        case notImplemented (message: String)
    }
    
    enum HttpMethod {
        case get
        case post
        case put
        case delete
        case patch
        var parameter  : String {
            switch self {
            case .get       : return "GET"
            case .post      : return "POST"
            case .put       : return "PUT"
            case .delete    : return "DELETE"
            case .patch     : return "PATCH"
            }
        }
    }
    
    // MARK: STATIC PRIVATE PROPERTIES
    //__________________________________________________________________________________________________________________
    private static let TXT_NO_DATA_RECEIVED     : String = "No data received"
    private static let TXT_NO_RESPONSE_RECEIVED : String = "No response received"
    private static let TXT_INVALID_URL          : String = "Invalid url path: "
    private static let TXT_INVALID_PARAMETERS   : String = "Invalid url parameters:  "
    
    // MARK: INSTANCE PRIVATE PROPERTIES
    //__________________________________________________________________________________________________________________
    private let urlSession  : URLSession
    private let username    : String
    private let password    : String
    private var token       : String?
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    public let decoder             : JSONDecoder
    
    
    // MARK: STATIC PUBLIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    public static func login(with token: GHConfiguration.Token,username: String) -> GHSession {
        
        /// initalize  session
        let session   : GHSession = GHSession(
            type      : nil,
            username  : username,
            password  : "",
            token     : token
        )
              
        /// Return configured session
        return session
    }
    
    // MARK: STATIC PRIVATE FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    private static func getConfiguration(for type: GHSession.SessionType?, username: GHConfiguration.Username,
                                         password: GHConfiguration.Password,
                                         token   : GHConfiguration.Token?  ) -> URLSessionConfiguration {
        
        /// Initialize local variables
        let configuration = URLSessionConfiguration.ephemeral
        let sessionType   : SessionType = ( type != nil ) ? type! : .standar
        
        /// Setup configuration object
        configuration.httpAdditionalHeaders = GHSession.getConfigurationHeaders(
            for     : sessionType,
            username: username,
            password: password,
            token   : token
            
        )
        
        return configuration
        
        
    }

    private static func getConfigurationHeaders(for type: GHSession.SessionType,username: GHConfiguration.Username,
                                                password: GHConfiguration.Password, token:GHConfiguration.Token?) -> [AnyHashable: Any]? {
        
        /// Initialize local variables
        var headers         : [AnyHashable: Any]? = [:]
        let authorization   : String
        
        /// Setup auhtorization header
        
        if let t = GHConfiguration.tokenAuthorization(token: token) {
            authorization = t
        } else {
            authorization = GHConfiguration.basicAuthorization(
                username,
                password
            )
        }
        
        
        headers?.updateValue(
            authorization  ,
            forKey      : GHConfiguration.headerAuthorization
        )
        
        /// Setup auhtorization header        
        headers?.updateValue(
            GHConfiguration.acceptHeaderParameters,
            forKey      : GHConfiguration.headerAccept
        )
        
        
        
        /// Setup specific type configuarion
        switch type {
        case .standar: do {
            }
        }
        
        /// Return configured header
        return headers
    }
    
    private static func getStatusCode(from response: URLResponse) -> Int {
        
        /// Try to cast response to HT
        if let httpResponse = response as?  HTTPURLResponse {
            return httpResponse.statusCode
        }
        
        return 0
    }
    
    private static func isErrorStatusCode() -> Bool {
        
        return false
    }
    
    
    
    // MARK: PRIVATE CONSTRUCTOR
    //__________________________________________________________________________________________________________________
    
    private init() {
        
        /// Initialize linstance properties
        self.username   = ""
        self.password   = ""
        self.urlSession = URLSession(
            configuration: GHSession.getConfiguration(
                for     : .standar,
                username: username,
                password: password,
                token   : nil
            )
        )
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(GHConfiguration.dateFormatter)
        
    }
    
    private init(
        type    : GHSession.SessionType?    ,
        username: GHConfiguration.Username  ,
        password: GHConfiguration.Password  ,
        token   : GHConfiguration.Token?    ) {
        
        /// Initialize linstance properties
        self.username   = username
        self.password   = password
        self.urlSession = URLSession(
            configuration: GHSession.getConfiguration(
                for     : type,
                username: username,
                password: password,
                token   : token
            )
        )
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(GHConfiguration.dateFormatter)
        
    }
    
    // MARK: PUBLIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    public func get(_ path     : GHConfiguration.ApiPath ,
                    with body  : [String:Any?]?,
                    completition    : @escaping GHConfiguration.RESTCompletition) -> Void {
        
        /// Execute "Get" Request
        executeAsync(
            path,
            with        : body,
            for         : .get){
                result in
                    switch (result) {
                    case .failure(let error) :do {
                        completition(.failure(error))
                        }
                        
                    case .success(let response) :  do {
                        completition(.success(response))
                        }
                    }
            }
    }
    
    public func post(_ path     : GHConfiguration.ApiPath ,
              with body  : [String:Any?]?,
              completition    : @escaping GHConfiguration.RESTCompletition) -> Void  {
        /// Execute "Post"  Request
        executeAsync(
            path,
            with        : body,
            for         : .post){
                result in
                    
                    switch (result) {
                    case .failure(let error) :do {
                        completition(.failure(error))
                        }
                        
                    case .success(let response) :  do {
                        completition(.success(response))
                        }
                    }
                    
                    
            }
    }
    
    public func put(_ path     : GHConfiguration.ApiPath ,
             with body  : [String:Any?]?,
             completition    : @escaping GHConfiguration.RESTCompletition) -> Void  {
        /// Execute "Put"  Request
        executeAsync(
            path,
            with        : body,
            for         : .put){
                result in
                    
                    switch (result) {
                    case .failure(let error) :do {
                        completition(.failure(error))
                        }
                        
                    case .success(let response) :  do {
                        completition(.success(response))
                        }
                    }
            }
    }
    
    public func delete(_ path     : GHConfiguration.ApiPath ,
                with body  : [String:Any?]?,
                completition    : @escaping GHConfiguration.RESTCompletition ) -> Void  {
        /// Execute "Delete"  Request
        executeAsync(
            path,
            with        : body,
            for         : .delete) {
                result in
                    
                    switch (result) {
                    case .failure(let error) :do {
                        completition(.failure(error))
                        }
                        
                    case .success(let response) :  do {
                        completition(.success(response))
                        }
                    }
                    
                    
            }
    }
    
    public func patch(_ path       : GHConfiguration.ApiPath,
               with body    : [String:Any?]?,
               completition    : @escaping GHConfiguration.RESTCompletition ) -> Void {
        /// Execute "Delete"  Request
        executeAsync(
            path,
            with        : body,
            for         : .patch ) {
            result in
                
                switch (result) {
                case .failure(let error) :do {
                    completition(.failure(error))
                    }
                    
                case .success(let response) :  do {
                    completition(.success(response))
                    }
                }
                
                
        }
        
    }
            
    public func currentUsername() -> String {
        // TODO: 🏷 Improve return current user name
        // with it could be better for user if loging does not requires username parameter
        
        return self.username
    }
    
    // MARK: PRIVATE FUNCTIONS
    //__________________________________________________________________________________________________________________

    
    private func executeAsync(
        _ path          : GHConfiguration.ApiPath,
        with body       : [String:Any?]?,
        for method      : HttpMethod ,
        completition    : @escaping GHConfiguration.RESTCompletition ) {
        
        /// Initialize valid url
        if let url = URL.init(string: "\(GHConfiguration.baseURL)\(path)") {

            /// Setup request
            var request         = URLRequest(url: url)
            request.httpMethod  = method.parameter
            if let body         = body {
                do {
                    request.httpBody = try JSONSerialization.data(
                        withJSONObject  : body,
                        options         : .prettyPrinted
                    )
                } catch {
                    
                    completition(
                        .failure(SessionError.requestError(message: GHSession.TXT_INVALID_PARAMETERS))
                    )
                    return
                    
                }
            }
            
            /// Execute data task
            urlSession.dataTask(with: request) {
                data, response, error in
                /// Verify response
                if let response = response {
                    
                    /// Verify http status code error
                    if ( response.hasError() ) {
                        
                        /// Create reponse error
                        let responseError           : GHError
                        let sessionError    : SessionError
                        
                        /// Verify data was received
                        if let d = data {
                            /// Try to get error message
                            do {
                                responseError = try self.decoder.decode(GHError.self, from: d)
                            }
                            /// When error message is not received
                            catch {
                                responseError = GHError.init(code: response.statusCode() )
                            }
                        }
                        /// When no data is received
                        else {
                            responseError = GHError(message: GHSession.TXT_NO_DATA_RECEIVED )
                        }
                        
                        // Complete fealure
                        sessionError    = SessionError.responseError(message: responseError.message)
                        completition(
                            .failure(sessionError)
                        )
                        return
                                                
                    }
                    /// When no error is received
                    else {
                        
                        /// Verify data was received
                        if let data = data {
                            completition(
                                .success(
                                    GHConfiguration.RESTResponse(
                                        data        : data,
                                        statusCode  : response.statusCode()
                                    )
                                )
                            )
                            return
                        }
                        /// When no data is received
                        else {
                            
                            completition(
                                .success(
                                    GHConfiguration.RESTResponse(
                                        data        : Data.init(),
                                        statusCode  : response.statusCode()
                                    )
                                )
                            )
                            return
                        }
                    }
                }
                /// When no response is received
                else {
                    
                    // complete failure
                    completition(
                        .failure(SessionError.responseError(message: GHSession.TXT_NO_RESPONSE_RECEIVED))
                    )
                }
            }.resume()
            
        }
        /// When is not posible a valid url
        else {
            
            // complete failure
            completition(
                .failure(SessionError.requestError(message: "\(GHSession.TXT_INVALID_URL)\(path)"))
            )
            
        }
        
    }
    
    
    
}


private extension URLResponse {
    
    func statusCode() -> Int {
        if let httpResponse = self as?  HTTPURLResponse {
            return httpResponse.statusCode
        }
        
        return 0
    }
    
    func hasError() -> Bool {
        
        if (statusCode() >= 400 ) {
            return true
        }
        
        return false
    }
    
}
