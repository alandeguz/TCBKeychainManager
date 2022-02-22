//
//  TCBKeychainStoreStatus.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * SecCopyErrorMessageString(_:_:)
 *
 * Security Framework Result Codes:
 * https://developer.apple.com/documentation/security/1542001-security_framework_result_codes
 */
public enum TCBKeychainStoreStatus: Error {
    case mismatchedType
    case deleteSuccess
    case result(status: OSStatus, item: CFTypeRef? = nil)
    case unhandledError(status: OSStatus, item: CFTypeRef? = nil)
    
    public var description: String? {
        switch self {
        case .mismatchedType:
            return "TCBKeychainStore Error: Mismatched `Item Type` with supported `Attribute Group`"
        case .deleteSuccess:
            return "TCBKeychainStore: Item(s) has been successfully deleted from the keychain."
        case .result(let status, _), .unhandledError(let status, _):
            return SecCopyErrorMessageString(status, nil) as String?
        }
    }
    
    public var item: CFTypeRef? {
        switch self {
        case .result(_, let item), .unhandledError(_, let item):
            return item
        default:
            return nil
        }
    }
}
