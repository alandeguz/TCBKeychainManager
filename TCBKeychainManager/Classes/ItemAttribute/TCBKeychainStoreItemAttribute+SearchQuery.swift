//
//  TCBKeychainStoreItemAttribute+SearchQuery.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Hipona on 2/20/22.
//

import Foundation

/**
 * Search Attribute Keys and Values: `Item Search Matching Keys`
 * https://developer.apple.com/documentation/security/keychain_services/keychain_items/search_attribute_keys_and_values
 */
public enum TCBKeychainStoreItemAttributeSearchQuery: TCBKeychainStoreItemQueryAttributeProtocol {

#if os(macOS)
    case subjectStartsWith
    case subjectEndsWith
    case subjectWholeString
    case diacriticInsensitive
    case widthInsensitive
#endif
    
    case policy
    case itemList
    case searchList
    case issuers
    case emailAddressIfPresent
    case subjectContains
    case caseInsensitive
    case trustedOnly
    case validOnDate
    /// limit: desired value of type `TCBKeychainStoreItemAttributeSearchQueryLimit`
    case limit
    
    public var attributeKey: String {
        switch self {
#if os(macOS)
        case .subjectStartsWith:
            return String(kSecMatchSubjectStartsWith)
        case .subjectEndsWith:
            return String(kSecMatchSubjectEndsWith)
        case .subjectWholeString:
            return String(kSecMatchSubjectWholeString)
        case .diacriticInsensitive:
            return String(kSecMatchDiacriticInsensitive)
        case .widthInsensitive:
            return String(kSecMatchWidthInsensitive)
#endif

        case .policy:
            return String(kSecMatchPolicy)
        case .itemList:
            return String(kSecMatchItemList)
        case .searchList:
            return String(kSecMatchSearchList)
        case .issuers:
            return String(kSecMatchIssuers)
        case .emailAddressIfPresent:
            return String(kSecMatchEmailAddressIfPresent)
        case .subjectContains:
            return String(kSecMatchSubjectContains)
        case .caseInsensitive:
            return String(kSecMatchCaseInsensitive)
        case .trustedOnly:
            return String(kSecMatchTrustedOnly)
        case .validOnDate:
            return String(kSecMatchValidOnDate)
        case .limit:
            return String(kSecMatchLimit)
        }
    }
}
