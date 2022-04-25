//
//  TCBKeychainStoreSecureAttributeAuthenticationType.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 4/25/22.
//

import Foundation

/**
 * Authentication Type Values
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/item_attribute_keys_and_values#1679017
 */

public enum TCBKeychainStoreSecureAttributeAuthenticationType: TCBKeychainStoreItemValueAttributeProtocol {
    
    /// Windows NT LAN Manager authentication.
    case kNTLM
    /// Microsoft Network default authentication.
    case kMSN
    /// Distributed Password authentication.
    case kDPA
    /// Remote Password authentication.
    case kRPA
    /// HTTP Basic authentication.
    case kHTTPBasic
    /// HTTP Digest Access authentication.
    case kHTTPDigest
    /// HTML form based authentication.
    case kHTMLForm
    /// The default authentication type.
    case kDefault
}

public extension TCBKeychainStoreSecureAttributeAuthenticationType {
    var attributeKey: String {
        switch self {
        case .kNTLM:
            return String(kSecAttrAuthenticationTypeNTLM)
        case .kMSN:
            return String(kSecAttrAuthenticationTypeMSN)
        case .kDPA:
            return String(kSecAttrAuthenticationTypeDPA)
        case .kRPA:
            return String(kSecAttrAuthenticationTypeRPA)
        case .kHTTPBasic:
            return String(kSecAttrAuthenticationTypeHTTPBasic)
        case .kHTTPDigest:
            return String(kSecAttrAuthenticationTypeHTTPDigest)
        case .kHTMLForm:
            return String(kSecAttrAuthenticationTypeHTMLForm)
        case .kDefault:
            return String(kSecAttrAuthenticationTypeDefault)
        }
    }
}

internal extension TCBKeychainStoreSecureAttributeAuthenticationType {
    var attributeValue: Any {
        switch self {
        case .kNTLM:
            return kSecAttrAuthenticationTypeNTLM
        case .kMSN:
            return kSecAttrAuthenticationTypeMSN
        case .kDPA:
            return kSecAttrAuthenticationTypeDPA
        case .kRPA:
            return kSecAttrAuthenticationTypeRPA
        case .kHTTPBasic:
            return kSecAttrAuthenticationTypeHTTPBasic
        case .kHTTPDigest:
            return kSecAttrAuthenticationTypeHTTPDigest
        case .kHTMLForm:
            return kSecAttrAuthenticationTypeHTMLForm
        case .kDefault:
            return kSecAttrAuthenticationTypeDefault
        }
    }
}
