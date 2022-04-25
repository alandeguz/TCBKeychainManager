//
//  TCBKeychainStoreAccessibilityRestriction.swift
//  Pods-TCBKeychainManager_Example
//
//  Created by Neil Francis Hipona on 4/25/22.
//

import Foundation

/**
 * Accessibility Values
 * https://developer.apple.com/documentation/security/ksecattraccessiblewhenpasscodesetthisdeviceonly
 */
public enum TCBKeychainStoreAccessibilityRestriction: TCBKeychainStoreItemValueAttributeProtocol {
    
    /// The data in the keychain can only be accessed when the device is unlocked. Only available if a passcode is set on the device.
    case whenPasscodeSetThisDeviceOnly
    /// The data in the keychain item can be accessed only while the device is unlocked by the user.
    case whenUnlockedThisDeviceOnly
    /// The data in the keychain item can be accessed only while the device is unlocked by the user.
    case whenUnlocked
    /// The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
    case afterFirstUnlockThisDeviceOnly
    /// The data in the keychain item cannot be accessed after a restart until the device has been unlocked once by the user.
    case afterFirstUnlock
    
    public var attributeKey: String {
        switch self {
        case .whenPasscodeSetThisDeviceOnly:
            return String(kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly)
        case .whenUnlockedThisDeviceOnly:
            return String(kSecAttrAccessibleWhenUnlockedThisDeviceOnly)
        case .whenUnlocked:
            return String(kSecAttrAccessibleWhenUnlocked)
        case .afterFirstUnlockThisDeviceOnly:
            return String(kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly)
        case .afterFirstUnlock:
            return String(kSecAttrAccessibleAfterFirstUnlock)
        }
    }
    
    internal var attributeValue: Any {
        switch self {
        case .whenPasscodeSetThisDeviceOnly:
            return kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
        case .whenUnlockedThisDeviceOnly:
            return kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        case .whenUnlocked:
            return kSecAttrAccessibleWhenUnlocked
        case .afterFirstUnlockThisDeviceOnly:
            return kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
        case .afterFirstUnlock:
            return kSecAttrAccessibleAfterFirstUnlock
        }
    }
}
