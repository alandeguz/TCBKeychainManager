//
//  TCBKeychainStoreItemType.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * Keys and Values:
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/item_attribute_keys_and_values
 */
public enum TCBKeychainStoreItemType: TCBKeychainStoreItemAttributeProtocol {
    
    case genericPassword
    case internetPassword
    case certificate
    case cryptic
    case identity
    
    public var attributeKey: String {
        switch self {
        case .genericPassword:
            return String(kSecClassGenericPassword)
        case .internetPassword:
            return String(kSecClassInternetPassword)
        case .certificate:
            return String(kSecClassCertificate)
        case .cryptic:
            return String(kSecClassKey)
        case .identity:
            return String(kSecClassIdentity)
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
