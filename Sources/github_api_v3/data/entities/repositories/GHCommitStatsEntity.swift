//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

class GHCommitStatsEntity: CommitStatsEntity {
    
    
        
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case additions   = "additions"
        case deletions   = "deletions"
        case total       = "total"
    }
        
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
        
    let additions   : Int
    let deletions   : Int
    let total       : Int
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
        
    required init(from decoder: Decoder) throws {
            
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHCommitStatsEntity.CodingKeys.self)
            
        /// Initialize instance properties
        do      { self.additions = try container.decode(Int.self, forKey: .additions)}
        catch   { self.additions = 0 }
        
        do      { self.deletions = try container.decode(Int.self, forKey: .deletions)}
        catch   { self.deletions = 0 }
        
        do      { self.total = try container.decode(Int.self, forKey: .total)}
        catch   { self.total = 0 }
        
            
    }
        
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
        
    func encode(to encoder: Encoder) throws {
            
    }
    
}
