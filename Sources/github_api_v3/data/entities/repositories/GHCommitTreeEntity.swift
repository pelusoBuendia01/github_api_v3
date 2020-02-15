//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

class GHCommitTreeEntity: CommitTreeEntity{
        
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case URL            = "url"
        case sha            = "sha"
    }
        
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
    var URL: String
    var sha: String
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
        
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHCommitTreeEntity.CodingKeys.self)
            
        /// Initialize instance properties
        do      { self.URL = try container.decode(String.self, forKey: .URL)}
        catch   { self.URL = "" }
        
        do      { self.sha = try container.decode(String.self, forKey: .sha)}
        catch   { self.sha = "" }
        
    }
        
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    func encode(to encoder: Encoder) throws {
            
    }
    
}
