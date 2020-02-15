//
//  GHConfiguration.swift
//  githubAPIv3
//
//  Created by Francisco Romero on 11/01/20.
//  Copyright © 2020 Francisco Romero. All rights reserved.
//

import Foundation

public struct GHConfiguration {
    
    // MARK: STRUCTS
    //__________________________________________________________________________________________________________________
    public struct    RESTResponse {
        public var data        : Data
        public var statusCode  : Int
    }
    
    // MARK: TYPE ALIAS
    //__________________________________________________________________________________________________________________
    public typealias ID                                        = Int
    public typealias Username                                  = String
    public typealias Password                                  = String
    public typealias Token                                     = String
    public typealias ApiPath                                   = String
    public typealias RESTCompletition                          = (Result<RESTResponse,Error>)  -> Void
    public typealias RESTConfirmation                          = (Result<Bool,Error>)          -> Void
    public typealias SuccessResponse                           = (_ data       : Data      )   -> Void
    public typealias ErrorResponse                             = (_ error      : GHError   )   -> Void
    
    // MARK: PRIVATE STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    private static let formatDate                   : String        = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    private static let acceptV3                     : String        = "application/vnd.github.v3+json"
    private static let acceptAntManPreview          : String        = "application/vnd.github.ant-man-preview+json"
    private static let acceptAntiopePreview         : String        = "application/vnd.github.antiope-preview+json"
    private static let acceptBaptistePreview        : String        = "application/vnd.github.baptiste-preview+json"
    private static let acceptBlackPanterPreview     : String        = "application/vnd.github.black-panther-preview+json"
    private static let acceptCloakPreview           : String        = "application/vnd.github.cloak-preview+json"
    private static let acceptComfortFadePreview     : String        = "application/vnd.github.comfort-fade-preview+json"
    private static let acceptDorianPreview          : String        = "application/vnd.github.dorian-preview+json"
    private static let acceptFlashPreview           : String        = "application/vnd.github.flash-preview+json"
    private static let acceptGiantSentry1stPreview  : String        = "application/vnd.github.giant-sentry-fist-preview+json"
    private static let acceptGrootPreview           : String        = "application/vnd.github.groot-preview+json"
    private static let acceptHagarPreview           : String        = "application/vnd.github.hagar-preview+json"
    private static let acceptInertiaPreview         : String        = "application/vnd.github.inertia-preview+json"
    private static let acceptLondonPreview          : String        = "application/vnd.github.london-preview+json"
    private static let acceptLukeCagePreview        : String        = "application/vnd.github.luke-cage-preview+json"
    private static let acceptMachineManPreview      : String        = "application/vnd.github.machine-man-preview+json"
    private static let acceptMercyPreview           : String        = "application/vnd.github.mercy-preview+json"
    private static let acceptMockingBirdPreview     : String        = "application/vnd.github.mockingbird-preview+json"
    private static let acceptNebulaPreview          : String        = "application/vnd.github.nebula-preview+json"
    private static let acceptSailorVPreview         : String        = "application/vnd.github.sailor-v-preview+json"
    private static let acceptShadowCatPreview       : String        = "application/vnd.github.shadow-cat-preview+json"
    private static let acceptSombraPreview          : String        = "application/vnd.github.sombra-preview+json"
    private static let acceptSquirrelGirlPreview    : String        = "application/vnd.github.squirrel-girl-preview+json"
    private static let acceptStarFoxPreview         : String        = "application/vnd.github.starfox-preview+json"
    private static let acceptSurturPreview          : String        = "application/vnd.github.surtur-preview+json"
    private static let acceptSwitcherooPreview      : String        = "application/vnd.github.switcheroo-preview+json"
    private static let acceptTextMatch              : String        = "application/vnd.github.v3.text-match+json"
    private static let acceptZzzaxPreview           : String        = "application/vnd.github.zzzax-preview+json"
    private static var formatterDate                : DateFormatter?
    
    
    // MARK: PUBLIC STATIC PROPERTIES
    //__________________________________________________________________________________________________________________
    static var enterpriseHost       : String?
    static let headerAuthorization  : String        = "Authorization"
    static let headerAccept         : String        = "Accept"
    static let dateFormatter        : DateFormatter = {
        /// Verify fomater instance
        if GHConfiguration.formatterDate ==  nil {
            /// Setup formater when does not exist
            GHConfiguration.formatterDate               = DateFormatter()
            GHConfiguration.formatterDate?.dateFormat   = GHConfiguration.formatDate
        }
        /// Return unique formater instance
        return GHConfiguration.formatterDate!
    }()
    static let baseURL              : String        = {
        
        /// Verify enterprise hostname definition
        if let hostname = GHConfiguration.enterpriseHost {
            return "\(hostname)/api/v3"
        }
            
        /// When hostname is not defined
        else {
            return "https://api.github.com"
        }
    }()
    static let acceptHeaderParameters : String      = {
        var parameter = "  \(acceptV3                   )"
        parameter    += ", \(acceptAntManPreview        )"
        parameter    += ", \(acceptAntiopePreview       )"
        parameter    += ", \(acceptBaptistePreview      )"
        parameter    += ", \(acceptBlackPanterPreview   )"
        parameter    += ", \(acceptCloakPreview         )"
        parameter    += ", \(acceptComfortFadePreview   )"
        parameter    += ", \(acceptDorianPreview        )"
        parameter    += ", \(acceptFlashPreview         )"
        parameter    += ", \(acceptGiantSentry1stPreview)"
        parameter    += ", \(acceptGrootPreview         )"
        parameter    += ", \(acceptHagarPreview         )"
        parameter    += ", \(acceptInertiaPreview       )"
        parameter    += ", \(acceptLondonPreview        )"
        parameter    += ", \(acceptLukeCagePreview      )"
        parameter    += ", \(acceptMachineManPreview    )"
        parameter    += ", \(acceptMercyPreview         )"
        parameter    += ", \(acceptMockingBirdPreview   )"
        parameter    += ", \(acceptNebulaPreview        )"
        parameter    += ", \(acceptSailorVPreview       )"
        parameter    += ", \(acceptShadowCatPreview     )"
        parameter    += ", \(acceptSombraPreview        )"
        parameter    += ", \(acceptSquirrelGirlPreview  )"
        parameter    += ", \(acceptStarFoxPreview       )"
        parameter    += ", \(acceptSurturPreview        )"
        parameter    += ", \(acceptSwitcherooPreview    )"        
        parameter    += ", \(acceptZzzaxPreview         )"
        parameter    += ", \(acceptTextMatch            )"
        return parameter
    }()
    
    // MARK: PUBLIC STATIC FUNCTIONS
    //__________________________________________________________________________________________________________________
    static func basicAuthorization(_ username:Username,_ password:Password) -> String {
        let userPasswordData        = "\(username):\(password)".data(using: .utf8)
        let base64EncodedCredential = userPasswordData!
            .base64EncodedString(
                options: Data.Base64EncodingOptions
                    .init(
                        rawValue: 0
            )
        )
        return "Basic \(base64EncodedCredential)"
    }
    
    static func tokenAuthorization(token: Token?) -> String? {
        if let token = token {
            return "token \(token)"
        }
        return nil
    }
    
}
