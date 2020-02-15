//
//  File.swift
//  
//
//  Created by Francisco Romero on 09/02/20.
//

import Foundation

public enum CommitVerificationReason : String {
    
    case expiredKey             = "expired_key"
    case notSigningKey          = "not_signing_key"
    case gpgverifyError         = "gpgverify_error"
    case gpgverifyUnavailable   = "gpgverify_unavailable"
    case unsigned               = "unsigned"
    case unknownSignatureType   = "unknown_signature_type"
    case noUser                 = "no_user"
    case unverifiedEmail        = "unverified_email"
    case badEmail               = "bad_email"
    case unknownKey             = "unknown_key"
    case malformedSignature     = "malformed_signature"
    case invalid                = "invalid"
    case valid                  = "valid"
    
    static func from (string : String) -> CommitVerificationReason? {
     
        switch (string) {
        case CommitVerificationReason.expiredKey.rawValue           : return .expiredKey
        case CommitVerificationReason.notSigningKey.rawValue        : return .notSigningKey
        case CommitVerificationReason.gpgverifyError.rawValue       : return .gpgverifyError
        case CommitVerificationReason.gpgverifyUnavailable.rawValue : return .gpgverifyUnavailable
        case CommitVerificationReason.unsigned.rawValue             : return .unsigned
        case CommitVerificationReason.unknownSignatureType.rawValue : return .unknownSignatureType
        case CommitVerificationReason.noUser.rawValue               : return .noUser
        case CommitVerificationReason.unverifiedEmail.rawValue      : return .unverifiedEmail
        case CommitVerificationReason.badEmail.rawValue             : return .badEmail
        case CommitVerificationReason.unknownKey.rawValue           : return .unknownKey
        case CommitVerificationReason.malformedSignature.rawValue   : return .malformedSignature
        case CommitVerificationReason.invalid.rawValue              : return .invalid
        case CommitVerificationReason.valid.rawValue                : return .valid
        default                                                     : return nil
            
        }
        
    }
    
    
}
