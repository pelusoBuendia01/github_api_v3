//
//  ProjectPermissionEntity.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com
/// - seeAlso: https://developer.github.com/v3/projects/

import Foundation

public protocol ProjectPermissionEntity: GHCodable {
    
    // MARK: CASES
    //__________________________________________________________________________________________________________________
    var permision : GHPermission {get}
    var user      : UserEntity? {get}
    
}
