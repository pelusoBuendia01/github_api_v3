//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

class GHCommitEntity: CommitEntity {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: String, CodingKey {
        case URL            = "url"
        case sha            = "sha"
        case nodeId         = "code_id"
        case htmlURL        = "html_url"
        case commentsURL    = "comment_url"
        case commit         = "commit"
        case author         = "author"
        case commiter       = "commiter"
        case parents        = "parents"
        case stats          = "stats"
        case files          = "fileš"
    }
    
    // MARK: OVERRIDE PROPERTIES [GHBranchEntity]
    //__________________________________________________________________________________________________________________
    var URL         : String
    var sha         : String
    var nodeId      : String?
    var htmlURL     : String?
    var commentsURS : String?
    var commit      : CommitDetailEntity?
    var author      : UserEntity?
    var commiter    : UserEntity?
    var parents     : [CommitTreeEntity]
    var stats       : CommitStatsEntity?
    var files       : [CommitFileEntity]
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHCommitEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.URL = try container.decode(String.self, forKey: .URL)}
        catch   { self.URL = "" }
        
        do      { self.sha = try container.decode(String.self, forKey: .sha)}
        catch   { self.sha = "" }
        
        do      { self.nodeId = try container.decode(String.self, forKey: .nodeId)}
        catch   { self.nodeId = nil }
        
        do      { self.htmlURL = try container.decode(String.self, forKey: .htmlURL)}
        catch   { self.htmlURL = nil }
        
        do      { self.commentsURS = try container.decode(String.self, forKey: .commentsURL)}
        catch   { self.commentsURS = nil }
        
        do      { self.author = try container.decode(GHUserEntity.self, forKey: .author)}
        catch   { self.author = nil }
        
        do      { self.commiter = try container.decode(GHUserEntity.self, forKey: .commiter)}
        catch   { self.commiter = nil }
        
        do      { self.parents = try container.decode([GHCommitTreeEntity].self, forKey: .parents)}
        catch   { self.parents = [] }
        
        do      { self.stats = try container.decode(GHCommitStatsEntity.self, forKey: .stats)}
        catch   { self.stats = nil }
        
        do      { self.files = try container.decode([GHCommitFileEntity].self, forKey: .files)}
        catch   { self.files = [] }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
}
