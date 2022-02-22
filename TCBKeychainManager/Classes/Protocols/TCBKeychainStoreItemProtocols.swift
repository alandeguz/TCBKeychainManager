//
//  TCBKeychainStoreItemProtocols.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 *
 * Item Class Keys and Values
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/item_class_keys_and_values
 *
 * Item Attribute Keys and Values
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/item_attribute_keys_and_values?language=objc
 *
 * SecItemDelete(_:)
 * https://developer.apple.com/documentation/security/1395547-secitemdelete
 *
 * Keychain Services
 * https://developer.apple.com/documentation/security/keychain_services
 *
 */

public protocol TCBKeychainStoreItemAttributeProtocol {
    var attributeKey: String { get }
}

public protocol TCBKeychainStoreItemQueryAttributeProtocol {
    var attributeKey: String { get }
}

public protocol TCBKeychainStoreItemQueryAttributeValueProtocol {
    var attributeValue: Any { get }
}
