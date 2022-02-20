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
    case result(status: OSStatus, item: CFTypeRef? = nil)
    case unhandledError(status: OSStatus, item: CFTypeRef? = nil)
    
    var description: String? {
        switch self {
        case .mismatchedType:
            return "TCBKeychainStore Error: Mismatched `Item Type` with supported `Attribute Group`"
        case .result(let status, _), .unhandledError(let status, _):
            return SecCopyErrorMessageString(status, nil) as String?
        }
    }
}
