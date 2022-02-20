//
//  TCBKeychainStoreUpdateManager.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * TCBKeychainStoreUpdateManager
 * The base class for handling an update request to the keychain store
 */
public struct TCBKeychainStoreUpdateManager<AttributeGroup: TCBKeychainStoreItemAttributeProtocol, AttributeSearchGroup: TCBKeychainStoreItemQueryAttributeProtocol> {
    
    public var itemType: TCBKeychainStoreItemType
    public var query: [String: Any]
    public var attributesToUpdate: [String: Any]
    
    private var secQuery: CFDictionary {
        query as CFDictionary
    }
    
    private var secAttributesToUpdate: CFDictionary {
        attributesToUpdate as CFDictionary
    }

    public init(itemType: TCBKeychainStoreItemType) {
        self.itemType = itemType
        self.query = [String(kSecClass): itemType.attributeKey]
        self.attributesToUpdate = [:]
    }
}

extension TCBKeychainStoreUpdateManager: TCBKeychainStoreUpdateProtocol {
    
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
    
    public mutating func addValueToUpdate(for attribute: AttributeGroup, value: Any) throws {
        guard itemType.secAttributeGroup == AttributeGroup.self
        else {
            throw TCBKeychainStoreStatus.mismatchedType
        }
        
        attributesToUpdate[attribute.attributeKey] = value
    }
    
    public func updateItem() throws -> TCBKeychainStoreStatus {
        let status = SecItemUpdate(secQuery, secAttributesToUpdate)
        guard status == errSecSuccess else { throw TCBKeychainStoreStatus.unhandledError(status: status) }
        return TCBKeychainStoreStatus.result(status: status)
    }
}
