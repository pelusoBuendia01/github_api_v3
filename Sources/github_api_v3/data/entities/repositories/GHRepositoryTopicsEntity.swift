//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

class GHRepositoryTopicsEntity: RepositoryTopicsEntity {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String,CodingKey {
        case names = "names"
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let  names  : [String]
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHRepositoryTopicsEntity.CodingKeys.self)
        
        /// Initialize instance properties
        
        do      { self.names = try container.decode([String].self, forKey: .names ) }
        catch   { self.names = [] }
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }

    
    
}
