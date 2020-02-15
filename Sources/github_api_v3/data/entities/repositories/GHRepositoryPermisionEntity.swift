//
//  GHRepositoryPermisionEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

class GHRepositoryPermisionEntity: RepositoryPermisionEntity {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
        case admin
        case pull
        case push
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let  admin  : Bool
    let  pull   : Bool
    let  push   : Bool
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHRepositoryPermisionEntity.CodingKeys.self)
        
        /// Initialize instance properties
        
        do      { self.admin = try container.decode(Bool.self, forKey: .admin ) }
        catch   { self.admin = false }
        
        do      { self.pull = try container.decode(Bool.self, forKey: .pull ) }
        catch   { self.pull = false }
        
        do      { self.push = try container.decode(Bool.self, forKey: .push ) }
        catch   { self.push = false }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }

    
}
