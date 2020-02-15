//
//  GHUtils.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 05/02/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public class GHUtils {
    
    public static func printJson(data: Data) {
        do {
        
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            print(json)
            
        } catch {
            
            print(error)
            
        }            
        
    }
    
    private init() {
    }
    
}
