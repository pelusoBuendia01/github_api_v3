//
//  GHError.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 11/01/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation



public struct GHError : Codable {
        
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    public enum CodingKeys: CodingKey {
        case message
        case documentation_url
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    public let message             : String
    public let documentationURL    : String
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    public init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHError.CodingKeys.self)
        
        /// Initialize instance properties
        message             = try container.decode(String.self  , forKey: .message)
        documentationURL    = try container.decode(String.self  , forKey: .documentation_url)
        
    }
    
    init(code: Int) {
        
        if (code >= 400 && code < 500)  {
            self.message            = "Client error \(code)"
        } else if ( code >= 500)  {
            self.message            = "Server error \(code)"
        } else if ( code >= 300 && code < 400 ) {
            self.message            = "Redirected code \(code)"
        } else {
            self.message            = "Status code \(code) is not an error"
        }
                
        self.documentationURL   = "No documentation"
    }
    
    init(message: String) {
        self.message = message
        self.documentationURL   = "No documentation"
    }
    
    init(message: String,errorLocation: String) {
        self.message = message
        self.documentationURL   = "No documentation BUT 🤔!!! you can check:\n\n\(errorLocation)\n\n"
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    public func encode(to encoder: Encoder) throws {
        
    }

}

