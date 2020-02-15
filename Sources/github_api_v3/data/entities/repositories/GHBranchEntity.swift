//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

class GHBranchEntity: BranchEntity {
    var commit: CommitEntity? = nil
    
       
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case name       = "name"
        case protected  = "protected"
        case protection = "protection"
    }
    
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
    var name        : String
    var protected   : Bool
    var protection  : RequiredStatusChecksEntity?
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHBranchEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.name = try container.decode(String.self, forKey: .name)}
        catch   { self.name = "" }
        
        do      { self.protected = try container.decode(Bool.self, forKey: .protected)}
        catch   { self.protected = false }
        
        do      { self.protection = try container.decode(GHRequiredStatusChecksEntity.self, forKey: .protection) }
        catch   { self.protection = nil }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
}
