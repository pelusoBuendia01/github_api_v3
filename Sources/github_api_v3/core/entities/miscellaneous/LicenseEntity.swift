//
//  LicenseEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol LicenseEntity : GHCodable {
    
    // MARK: PUBLIC PROPERTIES
    //__________________________________________________________________________________________________________________
    var key     : String { get }
    var name    : String { get }
    var nodeId  : String { get }
    var spdxId  : String { get }
    var url     : String { get }
    
}
