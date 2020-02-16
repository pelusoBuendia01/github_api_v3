//
//  GHProjectPermission.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

class GHProjectPermissionEntity : ProjectPermissionEntity {
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    
    enum CodingKeys: CodingKey {
        case permission
        case user
    }
    
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    let permision : GHPermission
    let user      : UserEntity?
    

    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHProjectPermissionEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { 
            let permsisionString    = try container.decode(String.self, forKey: .permission)                        
            self.permision          = GHPermission.from(string: permsisionString)
        } 
        catch   { self.permision    = GHPermission.from(string: "") }
        
        do      { self.user          = try container.decode(GHUserEntity.self, forKey: .user) } 
        catch   { self.user          = nil }
        
        
    }
    

    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
