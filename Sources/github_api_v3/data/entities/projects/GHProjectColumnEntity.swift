//
//  GHProjectColumn.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation


class GHProjectColumnEntity : ProjectColumnEntity {
    
    // MARK: PUBLIC STATIC VARIABLES
    //__________________________________________________________________________________________________________________
    static let NO_NAME          : String = "No name"
    static let NO_URL           : String = "No url"
    static let NO_PROJECT_URL   : String = "No project_url"
    static let NO_CARDS_URL     : String = "No cards_url"
    static let NO_NODE_ID       : String = "No node_id"
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
        case id
        case name
        case url
        case project_url
        case cards_url
        case node_id
        case created_at
        case updated_at
        
    }
    
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let id          : Int
    let name        : String
    let URL         : String
    let projectURL  : String
    let cardsURL    : String
    let nodeId      : String
    let createdAt   : Date?
    let updatedAt   : Date?
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHProjectColumnEntity.CodingKeys.self)
        /// Initialize instance properties
        self.id = try container.decode(Int.self, forKey: .id)
        
        do {
            self.name = try container.decode(String.self, forKey: .name)
        } catch {
            self.name = GHProjectColumnEntity.NO_NAME
        }

        do {
            self.URL = try container.decode(String.self, forKey: .url)
        } catch {
            self.URL = GHProjectColumnEntity.NO_URL
        }
       
        do {
            self.projectURL = try container.decode(String.self, forKey: .project_url)
        } catch {
            self.projectURL = GHProjectColumnEntity.NO_PROJECT_URL
        }
        
        do {
            self.cardsURL = try container.decode(String.self, forKey: .cards_url)
        } catch {
            self.cardsURL = GHProjectColumnEntity.NO_CARDS_URL
        }
         
        do {
            self.nodeId = try container.decode(String.self, forKey: .node_id)
        } catch {
            self.nodeId = GHProjectColumnEntity.NO_NODE_ID
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
    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
}

