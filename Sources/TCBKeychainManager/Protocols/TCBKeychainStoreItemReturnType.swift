//
//  TCBKeychainStoreItemReturnType.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * Item Return Result Keys
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/item_return_result_keys
 */

public enum TCBKeychainStoreItemReturnType {
    
    case data
    case attributes
    case reference
    case persistentReference
    
    public var attributeKey: String {
        switch self {
        case .data:
            return String(kSecReturnData)
        case .attributes:
            return String(kSecReturnAttributes)
        case .reference:
            return String(kSecReturnRef)
        case .persistentReference:
            return String(kSecReturnPersistentRef)
        }
    }
    
    internal var secReturnValue: CFBoolean {
        return kCFBooleanTrue
    }
}
