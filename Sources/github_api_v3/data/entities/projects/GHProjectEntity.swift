//
//  GHProject.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 02/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

class GHProjectEntity: ProjectEntity {
    
    // MARK: ENUM
    //__________________________________________________________________________________________________________________
    enum CodingKeys: CodingKey {
        case id
        case owner_url
        case url
        case html_url
        case columns_url
        case node_id
        case name
        case body
        case number
        case state
        case creator
        case created_at
        case updated_at
    }
 
    // MARK: INSTANCE PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    let id                  : Int
    let ownerURL            : String
    let URL                 : String
    let htmlURL             : String
    let columnsURL          : String
    let nodeId              : String
    let name                : String
    let body                : String
    let number              : Int
    let state               : String
    let creator             : UserEntity?
    let createdAt           : Date?
    let updatedAt           : Date?
    
    
    // MARK: OVERRIDE CONSTRUCTOR (Decodable)
    //__________________________________________________________________________________________________________________
    
    required init(from decoder: Decoder) throws {
        
        /// Initialize local variables
        let container = try decoder.container(keyedBy: GHProjectEntity.CodingKeys.self)
        /// Initialize instance properties
        self.id         = try container.decode(Int.self  , forKey: .id)
        self.number     = try container.decode(Int.self  , forKey: .number)
        
        do {
            self.ownerURL   = try container.decode(String.self  , forKey: .owner_url)
        }
        catch {
            self.ownerURL   = ""
        }
        
        do {
            self.URL   = try container.decode(String.self  , forKey: .url)
        }
        catch {
            self.URL   = ""
        }
        
        do {
            self.htmlURL   = try container.decode(String.self  , forKey: .html_url)
        }
        catch {
            self.htmlURL   = ""
        }

        
        do {
            self.columnsURL   = try container.decode(String.self  , forKey: .columns_url)
        }
        catch {
            self.columnsURL   = ""
        }
        
        do {
            self.nodeId   = try container.decode(String.self  , forKey: .node_id)
        }
        catch {
            self.nodeId   = ""
        }

        do {
            self.name   = try container.decode(String.self  , forKey: .name)
        }
        catch {
            self.name   = ""
        }

        do {
            self.body   = try container.decode(String.self  , forKey: .body)
        }
        catch {
            self.body   = ""
        }
        
        do {
            self.state   = try container.decode(String.self  , forKey: .state)
        }
        catch {
            self.state   = ""
        }
        
        do {
            self.creator  = try container.decode(GHUserEntity.self  , forKey: .creator)
        }
        catch {
            self.creator  = nil
        }
        
        
        do {
            self.createdAt  = try container.decode(Date.self  , forKey: .created_at)
        }
        catch {
            self.createdAt  = nil
        }
        
        
        
        do {
            self.updatedAt  = try container.decode(Date.self  , forKey: .updated_at)
        }
        catch {
            self.updatedAt  = nil
        }

    }
    
    // MARK: OVERRIDE FUNCTIONS [Encodable]
    //__________________________________________________________________________________________________________________
    
    func encode(to encoder: Encoder) throws {
        
    }
}
