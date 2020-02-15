//
//  GHProjectCard.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation


class GHProjectCardEntity : ProjectCardEntity {
    
    // MARK: PUBLIC STATIC VARIABLES
    //__________________________________________________________________________________________________________________
    static let NO_NODE_ID       : String = "No node_id"
    static let NO_NOTE          : String = "No note"
    static let NO_COLUMN_URL    : String = "No column_url"
    static let NO_CONTENT_URL   : String = "No content_url"
    static let NO_PROJECT_URL   : String = "No project_url"
    
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
        case id
        case node_id
        case note
        case creator
        case created_at
        case updated_at
        case archived
        case column_url
        case content_url
        case project_url
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let id          : Int
    let nodeId      : String
    let note        : String
    let creator     : UserEntity?
    let createdAt   : Date?
    let updatedAt   : Date?
    let archived    : Bool
    let columnURL   : String
    let contentURL  : String
    let projectURL  : String
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHProjectCardEntity.CodingKeys.self)
        /// Initialize instance properties
        self.id         = try container.decode(Int.self, forKey: .id)
        
        do {
            self.nodeId = try container.decode(String.self, forKey: .node_id)
        } catch {
            self.nodeId = GHProjectCardEntity.NO_NODE_ID
        }
        
        do {
            self.note = try container.decode(String.self, forKey: .note)
        } catch {
            self.note = GHProjectCardEntity.NO_NOTE
        }
        
        do {
            self.creator = try container.decode(GHUserEntity.self, forKey: .creator)
        } catch {
            self.creator = nil
        }
        
        do {
            self.createdAt = try container.decode(Date.self, forKey: .created_at)
        } catch {
            self.createdAt = nil
        }
        
        do {
            self.updatedAt = try container.decode(Date.self, forKey: .updated_at)
        } catch {
            self.updatedAt = nil
        }
        
        do {
            self.archived = try container.decode(Bool.self, forKey: .archived)
        } catch {
            self.archived = false
        }
        
        do {
            self.columnURL = try container.decode(String.self, forKey: .column_url)
        } catch {
            self.columnURL = GHProjectCardEntity.NO_COLUMN_URL
        }
        
        do {
            self.contentURL = try container.decode(String.self, forKey: .content_url)
        } catch {
            self.contentURL = GHProjectCardEntity.NO_CONTENT_URL
        }
        
        do {
            self.projectURL = try container.decode(String.self, forKey: .project_url)
        } catch {
            self.projectURL = GHProjectCardEntity.NO_PROJECT_URL
        }
        
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
}
