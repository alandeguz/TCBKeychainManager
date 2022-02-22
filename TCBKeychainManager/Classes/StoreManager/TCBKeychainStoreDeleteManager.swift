//
//  TCBKeychainStoreDeleteManager.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/22/22.
//

import Foundation

/**
 * TCBKeychainStoreDeleteManager
 * The base class for handling a delete request to the keychain store
 */
public struct TCBKeychainStoreDeleteManager<AttributeGroup: TCBKeychainStoreItemAttributeProtocol, AttributeSearchGroup: TCBKeychainStoreItemQueryAttributeProtocol> {
    
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

extension TCBKeychainStoreDeleteManager: TCBKeychainStoreDeleteProtocol {
    
    public mutating func addQuery(for attribute: AttributeGroup, value: Any) throws {
        guard itemType.secAttributeGroup == AttributeGroup.self
        else {
            throw TCBKeychainStoreStatus.mismatchedType
        }
        
        query[attribute.attributeKey] = value
    }
    
    public mutating func addSearchQuery(for attribute: AttributeSearchGroup, value: Any) throws {
        query[attribute.attributeKey] = value
    }
        
    public func deleteItem() throws -> TCBKeychainStoreStatus {
        let status = SecItemDelete(secQuery)
        guard status == errSecSuccess else { throw TCBKeychainStoreStatus.unhandledError(status: status) }
        return TCBKeychainStoreStatus.deleteSuccess
    }
}
