//
//  AppsRepo.swift
//  githubAPIv3
//
/// - copyright: <http://unlicense.org/>
/// - author: francisco.romero.valle.01@gmail.com

import Foundation

public protocol AppsRepo : GHRepository {
 
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultApp         = (Result< AppEntity    ,Error> ) -> Void
    typealias ResultAppList     = (Result<[AppEntity]   ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
}
