//
//  TCBKeychainStoreItemAttribute+Common.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 3/3/22.
//

import Foundation

/**
 * General Item Attribute Keys
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/item_attribute_keys_and_values
 */
public enum TCBKeychainStoreItemAttributeCommon: TCBKeychainStoreItemValueAttributeProtocol  {
    
#if os(macOS)
    /// A key whose value in an access instance indicating access control list settings for this item.
    case access(value: SecAccess) // (macOS only)
#endif

    /// A key whose value in an access control instance indicating access control settings for the item.
    case accessControl(value: SecAccessControl)
    /// A key whose value is a string indicating the access group an item is in.
    case accessGroup(value: String) // (iOS; also macOS if kSecAttrSynchronizable specified)
    /// A key whose value indicates when a keychain item is accessible.
    case accessible(value: TCBKeychainStoreAccessibilityRestriction) // (iOS; also macOS if kSecAttrSynchronizable specified)
    /// A key whose value is a string indicating whether the item is synchronized through iCloud.
    case synchronizable(value: Bool)
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
    /// A key whose value is a string that provides a sync view hint.
    case syncViewHint(value: String)
    
    case persistantReference
    case persistentReference
    
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
        case .synchronizable:
            return String(kSecAttrSynchronizable)
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
        case .syncViewHint:
            return String(kSecAttrSyncViewHint)
        case .persistantReference:
            return String(kSecAttrPersistantReference)
        case .persistentReference:
            return String(kSecAttrPersistentReference)
        }
    }
    
    internal var attributeValue: Any {
        switch self {
#if os(macOS)
        case .access(let value): // mac only
            return value.attributeValue
#endif

        case .accessControl(let value):
            return value
        case .accessGroup(let value):
            return value
        case .accessible(let value):
            return value.attributeValue
        case .synchronizable(let value):
            return value
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
        case .syncViewHint(let value):
            return value
            
        case .persistantReference:
            return String(kSecAttrPersistantReference)
        case .persistentReference:
            return String(kSecAttrPersistentReference)
        }
    }
}
