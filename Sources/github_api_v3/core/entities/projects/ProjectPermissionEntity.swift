//
//  ProjectPermissionEntity.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 06/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol ProjectPermissionEntity: GHCodable {
    
    var permision : GHPermission {get}
    var user      : UserEntity? {get}
    
}
