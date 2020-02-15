//
//  GHIssueCommentEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation


class GHIssueCommentEntity: IssueCommentEntity {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        //let container = try decoder.container(keyedBy: GHUserEntity.CodingKeys.self)
        
        /// Initialize instance properties
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
}
