//
//  TCBKeychainStoreProtocol.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

public protocol TCBKeychainStoreItemAttributeProtocol {
    var attributeKey: String { get }
}

public protocol TCBKeychainStoreProtocol {
    associatedtype AttributeGroup
    
    mutating func addValue(for attribute: AttributeGroup, value: Any) throws
    func saveSecItem() throws -> OSStatus
}
