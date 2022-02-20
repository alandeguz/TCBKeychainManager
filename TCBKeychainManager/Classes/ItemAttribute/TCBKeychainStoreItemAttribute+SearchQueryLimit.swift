//
//  TCBKeychainStoreItemAttribute+SearchQueryLimit.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

public enum TCBKeychainStoreItemAttributeSearchQueryLimit: TCBKeychainStoreItemQueryAttributeValueProtocol {
    
    case limitOne
    case limit(count: Int)
    case limitAll
    
    public var attributeValue: Any {
        switch self {
        case .limitOne:
            return String(kSecMatchLimitOne)
        case .limit(let count):
            return NSNumber(value: count)
        case .limitAll:
            return String(kSecMatchLimitAll)
        }
    }
}
