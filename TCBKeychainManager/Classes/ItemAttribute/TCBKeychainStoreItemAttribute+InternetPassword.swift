//
//  TCBKeychainStoreItemAttribute+InternetPassword.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * kSecClassInternetPassword
 * https://developer.apple.com/documentation/security/ksecclassinternetpassword
 */
public enum TCBKeychainStoreItemAttributeInternetPassword: TCBKeychainStoreItemAttributeProtocol {
    
#if os(macOS)
    case access // (macOS only)
#endif
    
    case accessGroup // (iOS; also macOS if `synchronizable` specified)
    case accessible // (iOS; also macOS if `synchronizable` specified)
    case creationDate
    case modificationDate
    case description
    case comment
    case creator
    case type
    case label
    case isInvisible
    case isNegative
    case account
    case securityDomain
    case server
    case `protocol`
    case authenticationType
    case port
    case path
    case synchronizable
    
    public var attributeKey: String {
        switch self {
#if os(macOS)
        case .access:
            return String(kSecAttrAccess) // (macOS only)
#endif
        case .accessGroup:
            return String(kSecAttrAccessGroup) // (iOS; also macOS if kSecAttrSynchronizable specified)
        case .accessible:
            return String(kSecAttrAccessible) // (iOS; also macOS if kSecAttrSynchronizable specified)
        case .creationDate:
            return String(kSecAttrCreationDate)
        case .modificationDate:
            return String(kSecAttrModificationDate)
        case .description:
            return String(kSecAttrDescription)
        case .comment:
            return String(kSecAttrComment)
        case .creator:
            return String(kSecAttrCreator)
        case .type:
            return String(kSecAttrType)
        case .label:
            return String(kSecAttrLabel)
        case .isInvisible:
            return String(kSecAttrIsInvisible)
        case .isNegative:
            return String(kSecAttrIsNegative)
        case .account:
            return String(kSecAttrAccount)
        case .securityDomain:
            return String(kSecAttrSecurityDomain)
        case .server:
            return String(kSecAttrServer)
        case .protocol:
            return String(kSecAttrProtocol)
        case .authenticationType:
            return String(kSecAttrAuthenticationType)
        case .port:
            return String(kSecAttrPort)
        case .path:
            return String(kSecAttrPath)
        case .synchronizable:
            return String(kSecAttrSynchronizable)
        }
    }
    
    public var attributeValue: Any {
        return "TODO: add value"
    }
}
