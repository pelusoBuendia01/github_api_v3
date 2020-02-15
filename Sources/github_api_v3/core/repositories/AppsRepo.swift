//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

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
