//
//  TCBKeychainStoreError.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

public enum TCBKeychainStoreError: Error {
    case mismatchedType
    case noPassword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}
