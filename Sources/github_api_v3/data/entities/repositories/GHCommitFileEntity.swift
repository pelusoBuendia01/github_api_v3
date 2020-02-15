//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

class GHCommitFileEntity: CommitFileEntity {
    
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case filename   = "file_name"
        case additions  = "additions"
        case deletions  = "deletions"
        case changes    = "changes"
        case status     = "status"
        case rawURL     = "raw_url"
        case blobURL    = "blob_url"
        case patch      = "patch"
    }
        
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
    var filename    : String
    var additions   : Int
    var deletions   : Int
    var changes     : Int
    var status      : String
    var rawURL      : String
    var blobURL     : String
    var patch       : String
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
        
    required init(from decoder: Decoder) throws {
            
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHCommitFileEntity.CodingKeys.self)
            
        /// Initialize instance properties
        do      { self.filename = try container.decode(String.self, forKey: .filename)}
        catch   { self.filename = "" }
        
        do      { self.additions = try container.decode(Int.self, forKey: .additions)}
        catch   { self.additions = 0 }
        
        do      { self.deletions = try container.decode(Int.self, forKey: .deletions)}
        catch   { self.deletions = 0 }
        
        do      { self.changes = try container.decode(Int.self, forKey: .changes)}
        catch   { self.changes = 0 }
        
        do      { self.status = try container.decode(String.self, forKey: .status)}
        catch   { self.status = "" }
        
        do      { self.rawURL = try container.decode(String.self, forKey: .rawURL)}
        catch   { self.rawURL = "" }
        
        do      { self.blobURL = try container.decode(String.self, forKey: .blobURL)}
        catch   { self.blobURL = "" }
        
        do      { self.patch = try container.decode(String.self, forKey: .patch)}
        catch   { self.patch = "" }
            
    }
        
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
        
    func encode(to encoder: Encoder) throws {
            
    }
    
}
