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
public enum TCBKeychainStoreItemAttributeInternetPassword: TCBKeychainStoreItemValueAttributeProtocol {
    
#if os(macOS)
    /// A key whose value in an access instance indicating access control list settings for this item.
    case access(value: SecAccess) // (macOS only)
#endif
    
    /// A key whose value is a string indicating the access group an item is in.
    case accessGroup(value: String) // (iOS; also macOS if kSecAttrSynchronizable specified)
    /// A key whose value indicates when a keychain item is accessible.
    case accessible(value: TCBKeychainStoreAccessibilityRestriction) // (iOS; also macOS if kSecAttrSynchronizable specified)
    /// A key whose value indicates the item's creation date.
    case creationDate(value: Date)
    /// A key whose value indicates the item's last modification date.
    case modificationDate(value: Date)
    /// A key whose value is a string indicating the item's description.
    case description(value: String)
    /// A key whose value is a string indicating a comment associated with the item.
    case comment(value: String)
    /// A key whose value indicates the item's creator.
    case creator(value: NSNumber)
    /// A key whose value indicates the item's type.
    case type(value: NSNumber)
    /// A key whose value is a string indicating the item's label.
    case label(value: String)
    /// A key whose value is a Boolean indicating the item's visibility.
    case isInvisible(value: Bool)
    /// A key whose value is a Boolean indicating whether the item has a valid password.
    case isNegative(value: Bool)
    /// A key whose value is a string indicating the item's account name.
    case account(value: String)
    /// A key whose value is a string indicating the item's security domain.
    case securityDomain(value: String)
    /// A key whose value is a string indicating the item's server.
    case server(value: String)
    /// A key whose value indicates the item's protocol.
    case `protocol`(value: TCBKeychainStoreSecureAttributeItemProtocol)
    /// A key whose value indicates the item's authentication scheme.
    case authenticationType(value: TCBKeychainStoreSecureAttributeAuthenticationType)
    /// A key whose value indicates the item's port.
    case port
    /// A key whose value is a string indicating the item's path attribute.
    case path
    /// A key whose value is a string indicating whether the item is synchronized through iCloud.
    case synchronizable
}

public extension TCBKeychainStoreItemAttributeInternetPassword {
    var attributeKey: String {
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
}

public extension TCBKeychainStoreItemAttributeInternetPassword {
    var attributeValue: Any {
        switch self {
#if os(macOS)
        case .access(let value): // mac only
            return value.attributeValue
#endif
        case .accessGroup(let value):
            return value
        case .accessible(let value):
            return value.attributeValue
        case .creationDate(let value):
            return value
        case .modificationDate(let value):
            return value
        case .description(let value):
            return value
        case .comment(let value):
            return value
        case .creator(let value):
            return value
        case .type(let value):
            return value
        case .label(let value):
            return value
        case .isInvisible(let value):
            return value
        case .isNegative(let value):
            return value
        case .account:
            return String(kSecAttrAccount)
        case .securityDomain:
            return String(kSecAttrSecurityDomain)
        case .server:
            return String(kSecAttrServer)
        case .protocol(let value):
            return value.attributeValue
        case .authenticationType(let value):
            return value.attributeValue
        case .port:
            return String(kSecAttrPort)
        case .path:
            return String(kSecAttrPath)
        case .synchronizable:
            return String(kSecAttrSynchronizable)
        }
    }
}
