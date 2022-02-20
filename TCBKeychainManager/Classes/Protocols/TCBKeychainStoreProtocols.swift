//
//  TCBKeychainStoreProtocols.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * SecItemAdd(_:_:)
 * https://developer.apple.com/documentation/security/1401659-secitemadd
 */
public protocol TCBKeychainStoreProtocol {
    associatedtype AttributeGroup
    
    mutating func addValue(for attribute: AttributeGroup, value: Any) throws
    mutating func addReturnType(with type: TCBKeychainStoreItemReturnType)
    
    func saveItem() throws -> TCBKeychainStoreStatus
}

/**
 * Search Attribute Keys and Values: `SecItemCopyMatching`
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/search_attribute_keys_and_values
 * 
 * SecItemCopyMatching(_:_:)
 * https://developer.apple.com/documentation/security/1398306-secitemcopymatching
 */
public protocol TCBKeychainStoreSearchProtocol {
    associatedtype AttributeGroup
    associatedtype AttributeSearchGroup
    
    mutating func addSearchValue(for attribute: AttributeGroup, value: Any) throws
    mutating func addSearchQuery(for attribute: AttributeSearchGroup, value: Any) throws
    mutating func addReturnType(with type: TCBKeychainStoreItemReturnType)
    
    func searchItem() throws -> TCBKeychainStoreStatus
}

/**
 * SecItemUpdate(_:_:)
 * https://developer.apple.com/documentation/security/1393617-secitemupdate
 */
public protocol TCBKeychainStoreUpdateProtocol {
    associatedtype AttributeGroup
    associatedtype AttributeSearchGroup
    
    mutating func addQuery(for attribute: AttributeGroup, value: Any) throws
    mutating func addSearchQuery(for attribute: AttributeSearchGroup, value: Any) throws
    mutating func addValueToUpdate(for attribute: AttributeGroup, value: Any) throws
    
    func updateItem() throws -> TCBKeychainStoreStatus
}
