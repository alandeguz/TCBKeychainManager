//
//  TCBKeychainManager.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 SecItemAdd(_:_:):
 https://developer.apple.com/documentation/security/1401659-secitemadd
 */
public struct TCBKeychainManager<AttributeGroup: TCBKeychainStoreItemAttributeProtocol>: TCBKeychainStoreProtocol {
    
    public var itemType: TCBKeychainStoreItemType
    public var query: [String: Any]
    
    private var secQuery: CFDictionary {
        query as CFDictionary
    }

    public init(itemType: TCBKeychainStoreItemType) {
        self.itemType = itemType
        self.query = [String(kSecClass): itemType.secValue]
    }
    
    public mutating func addValue(for attribute: AttributeGroup, value: Any) throws {
        guard itemType.secAttributeGroup == AttributeGroup.self
        else {
            throw TCBKeychainStoreError.mismatchedType
        }
        
        query[attribute.attributeKey] = value
    }

    @discardableResult
    public func saveSecItem() throws -> OSStatus {
        let status = SecItemAdd(secQuery, nil)
        guard status == errSecSuccess else { throw TCBKeychainStoreError.unhandledError(status: status) }
        return status
    }
}
