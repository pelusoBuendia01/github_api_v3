//
//  File.swift
//  
//
//  Created by Francisco Romero on 14/02/20.
//

import Foundation

class GHBranchRestrictionEntity: BranchRestrictionEntity {
    
 
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys:  CodingKey {
    }
    
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        //let container = try decoder.container(keyedBy: GHBranchEntity.CodingKeys.self)
        
        /// Initialize instance properties
        //do      { self.name = try container.decode(String.self, forKey: .name)}
        //catch   { self.name = "" }
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
