//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

class GHRequiredStatusChecksEntity: RequiredStatusChecksEntity {
   
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case strict     = "strict"
        case context    = "context"
    }
    
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
    var strict  : Bool
    var context : [String]
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHRequiredStatusChecksEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.strict   = try container.decode(Bool.self, forKey: .strict)}
        catch   { self.strict   = false }
        
        do      { self.context  = try container.decode([String].self, forKey: .context)}
        catch   { self.context   = [] }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
