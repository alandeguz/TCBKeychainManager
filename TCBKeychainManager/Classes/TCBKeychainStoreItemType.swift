//
//  TCBKeychainStoreItemType.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 Keys and Values:
 https://developer.apple.com/documentation/security/keychain_services/keychain_items/item_attribute_keys_and_values
 */
public enum TCBKeychainStoreItemType {
    case genericPassword
    case internetPassword
    case certificate
    case cryptic
    case identity
    
    internal var secValue: CFString {
        switch self {
        case .genericPassword:
            return kSecClassGenericPassword
        case .internetPassword:
            return kSecClassInternetPassword
        case .certificate:
            return kSecClassCertificate
        case .cryptic:
            return kSecClassKey
        case .identity:
            return kSecClassIdentity
        }
    }
    
    internal var secAttributeGroup: TCBKeychainStoreItemAttributeProtocol.Type {
        switch self {
        case .genericPassword:
            return TCBKeychainStoreItemAttributeGenericPassword.self
        case .internetPassword:
            return TCBKeychainStoreItemAttributeInternetPassword.self
        case .certificate:
            return TCBKeychainStoreItemAttributeCertificate.self
        case .cryptic:
            return TCBKeychainStoreItemAttributeCryptic.self
        case .identity:
            return TCBKeychainStoreItemAttributeIdentity.self
        }
    }
}
