//
//  TCBKeychainStoreSearchManager.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * TCBKeychainStoreSearchManager
 * The base class for handling a retrieval request to the keychain store
 */
public struct TCBKeychainStoreSearchManager<AttributeGroup: TCBKeychainStoreItemAttributeProtocol, AttributeSearchGroup: TCBKeychainStoreItemQueryAttributeProtocol> {
    
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

extension TCBKeychainStoreSearchManager: TCBKeychainStoreSearchProtocol {
    
    public mutating func addSearchValue(for attribute: AttributeGroup, value: Any) throws {
        guard itemType.secAttributeGroup == AttributeGroup.self
        else {
            throw TCBKeychainStoreStatus.mismatchedType
        }
        
        query[attribute.attributeKey] = value
    }
    
    public mutating func addSearchQuery(for attribute: AttributeSearchGroup, value: Any) throws {
        query[attribute.attributeKey] = value
    }
    
    public mutating func addReturnType(with type: TCBKeychainStoreItemReturnType) {
        query[type.attributeKey] = type.secReturnValue
    }
    
    public func searchItem() throws -> TCBKeychainStoreStatus {
        var item: CFTypeRef?
        let status = SecItemCopyMatching(secQuery, &item)
        guard status == errSecSuccess else { throw TCBKeychainStoreStatus.unhandledError(status: status, item: item) }
        return TCBKeychainStoreStatus.result(status: status, item: item)
    }
}
