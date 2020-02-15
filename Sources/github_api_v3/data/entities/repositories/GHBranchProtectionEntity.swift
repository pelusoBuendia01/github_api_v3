//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

class GHBranchProtectionEntity : BranchProtectionEntity {
    
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys:String, CodingKey {
        case enabled                = "enabled"
        case requiredStatusChecks   = "required_status_checks"
    }
    
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
    let enabled             : Bool
    let requiredStatusChecks: Bool
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHBranchProtectionEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.enabled              = try container.decode(Bool.self, forKey: .enabled)}
        catch   { self.enabled              = false }
        
        do      { self.requiredStatusChecks = try container.decode(Bool.self, forKey: .requiredStatusChecks)}
        catch   { self.requiredStatusChecks = false }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}
