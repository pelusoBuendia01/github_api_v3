//
//  File.swift
//  
//
//  Created by Francisco Romero on 14/02/20.
//

import Foundation


class GHBranchProtectionRequiredSignaturesEntity: BranchProtectionRequiredSignaturesEntity {
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case url        = "url"
        case enabled    = "enabled"
    }
    
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
    var URL: String
    
    var enabled: Bool
    
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
        
    required init(from decoder: Decoder) throws {
            
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHBranchProtectionRequiredSignaturesEntity.CodingKeys.self)
            
        /// Initialize instance properties
        do      { self.URL = try container.decode(String.self, forKey: .url)}
        catch   { self.URL = "" }
        do      { self.enabled = try container.decode(Bool.self, forKey: .enabled)}
        catch   { self.enabled = false }
        
        
            
    }
        
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
        
    func encode(to encoder: Encoder) throws {
            
    }
    
    
}
