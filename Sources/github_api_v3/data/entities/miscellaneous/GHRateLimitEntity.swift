//
//  GHRateLimitEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/misc/

import Foundation


class GHRateLimitEntity: RateLimitEntity {
    
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    
    enum CodingKeys:String, CodingKey {
        case resources  = "resources"
        case rate       = "rate"
    }
    
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    let resources   : RateLimitResurcesEntity?
    let rate        : RateLimitItemEntity?
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHRateLimitEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.resources = try container.decode(GHRateLimitResurcesEntity.self, forKey: .resources) }
        catch   { self.resources = nil  }
        
        do      { self.rate = try container.decode(GHRateLimitItemEntity.self, forKey: .resources) }
        catch   { self.rate = nil  }
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
}


class GHRateLimitResurcesEntity: RateLimitResurcesEntity {
    
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    
    enum CodingKeys: String, CodingKey {
        case core                   = "core"
        case search                 = "search"
        case graphql                = "graphql"
        case integrationManifest    = "integration_manifest"
    }
    
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    var core                : RateLimitItemEntity?
    var search              : RateLimitItemEntity?
    var graphql             : RateLimitItemEntity?
    var integrationManifest : RateLimitItemEntity?
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHRateLimitResurcesEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.core = try container.decode(GHRateLimitItemEntity.self, forKey: .core) }
        catch   { self.core = nil  }
        
        do      { self.search = try container.decode(GHRateLimitItemEntity.self, forKey: .search) }
        catch   { self.search = nil  }
        
        do      { self.graphql = try container.decode(GHRateLimitItemEntity.self, forKey: .graphql) }
        catch   { self.graphql = nil  }
        
        do      { self.integrationManifest = try container.decode(GHRateLimitItemEntity.self, forKey: .integrationManifest) }
        catch   { self.integrationManifest = nil  }
        
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
    
}

class GHRateLimitItemEntity: RateLimitItemEntity {
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    
    enum CodingKeys: String, CodingKey {
        case limit      = "limit"
        case remaining  = "remaining"
        case reset      = "reset"
    }
    
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    
    var limit       : Int
    var remaining   : Int
    var reset       : Int
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHRateLimitItemEntity.CodingKeys.self)
        
        /// Initialize instance properties
        do      { self.limit = try container.decode(Int.self, forKey: .limit)}
        catch   { self.limit = Int.zero }
        
        do      { self.remaining = try container.decode(Int.self, forKey: .remaining)}
        catch   { self.remaining = Int.zero }
        
        do      { self.reset = try container.decode(Int.self, forKey: .reset)}
        catch   { self.reset = Int.zero }
    }
    
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
    
    
}


