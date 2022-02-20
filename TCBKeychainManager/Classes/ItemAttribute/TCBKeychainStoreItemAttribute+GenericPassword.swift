//
//  TCBKeychainStoreItemAttribute+GenericPassword.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * kSecClassGenericPassword:
 * https://developer.apple.com/documentation/security/ksecclassgenericpassword
 *
 * Adding Password:
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/adding_a_password_to_the_keychain
 */
public enum TCBKeychainStoreItemAttributeGenericPassword: TCBKeychainStoreItemAttributeProtocol {
#if os(macOS)
    case access // mac
#endif

    case accessControl
    case accessGroup // (iOS; also macOS if kSecAttrSynchronizable specified)
    case accessible // (iOS; also macOS if kSecAttrSynchronizable specified)
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
    case service
    case generic
    case synchronizable
    case password // String -> Data; Encoding: String.Encoding.utf8

    public var attributeKey: String {
        switch self {
#if os(macOS)
        case .access: // mac only
            return String(kSecAttrAccess)
#endif

        case .accessControl:
            return String(kSecAttrAccessControl)
        case .accessGroup:
            return String(kSecAttrAccessGroup)
        case .accessible:
            return String(kSecAttrAccessible)
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
        case .service:
            return String(kSecAttrService)
        case .generic:
            return String(kSecAttrGeneric)
        case .synchronizable:
            return String(kSecAttrSynchronizable)
        case .password:
            return String(kSecValueData)
        }
    }
}
