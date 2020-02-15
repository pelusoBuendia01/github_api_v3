//
//  TeamsRepository.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 03/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public protocol TeamsRepo : GHRepository {
    
    // MARK: TYPEALIAS
    //__________________________________________________________________________________________________________________
    typealias ResultTeam            = (Result< TeamEntity   ,Error> ) -> Void
    typealias ResultTeamList        = (Result<[TeamEntity]  ,Error> ) -> Void
    
    // MARK: VARIABLES
    //__________________________________________________________________________________________________________________
    
    // MARK: FUNCTIONS
    //__________________________________________________________________________________________________________________
    
    
}
