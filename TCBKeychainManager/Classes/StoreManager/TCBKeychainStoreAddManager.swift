//
//  TCBKeychainStoreAddManager.swift
//  TCBKeychainStoreAddManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * TCBKeychainStoreAddManager
 * The base class for handling a request modification to the keychain store
 */
public struct TCBKeychainStoreAddManager<AttributeGroup: TCBKeychainStoreItemAttributeProtocol> {
    
    public var itemType: TCBKeychainStoreItemType
    public var query: [String: Any]
    
    private var secQuery: CFDictionary {
        query as CFDictionary
    }

    public init(itemType: TCBKeychainStoreItemType) {
        self.itemType = itemType
        self.query = [String(kSecClass): itemType.attributeKey]
    }
}

extension TCBKeychainStoreAddManager: TCBKeychainStoreProtocol {
    
    public mutating func addValue(for attribute: AttributeGroup, value: Any) throws {
        guard itemType.secAttributeGroup == AttributeGroup.self
        else {
            throw TCBKeychainStoreStatus.mismatchedType
        }
        
        query[attribute.attributeKey] = value
    }
    
    public mutating func addReturnType(with type: TCBKeychainStoreItemReturnType) {
        query[type.attributeKey] = type.secReturnValue
    }

    @discardableResult
    public func saveItem() throws -> TCBKeychainStoreStatus {
        var item: CFTypeRef?
        let status = SecItemAdd(secQuery, &item)
        guard status == errSecSuccess else { throw TCBKeychainStoreStatus.unhandledError(status: status, item: item) }
        return TCBKeychainStoreStatus.itemAdded(item: item)
    }
}
