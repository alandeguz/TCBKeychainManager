# TCBKeychainManager

[![CI Status](https://img.shields.io/travis/TCBKeychainManager/TCBKeychainManager.svg?style=flat)](https://travis-ci.org/TCBKeychainManager/TCBKeychainManager)
[![Version](https://img.shields.io/cocoapods/v/TCBKeychainManager.svg?style=flat)](https://cocoapods.org/pods/TCBKeychainManager)
[![License](https://img.shields.io/cocoapods/l/TCBKeychainManager.svg?style=flat)](https://cocoapods.org/pods/TCBKeychainManager)
[![Platform](https://img.shields.io/cocoapods/p/TCBKeychainManager.svg?style=flat)](https://cocoapods.org/pods/TCBKeychainManager)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

TCBKeychainManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'TCBKeychainManager'
```

If pods path is not found. Use format: 
```ruby
pod 'TCBKeychainManager', :git => 'https://github.com/TheCodingBug/TCBKeychainManager.git'
```

## Sample Usage

Sample usage of class managers for specific purposes, nescessary config changes are expected from integrators:

Sample constructor for adding an `Item` to the `Keychain`.
```Swift
var manager = TCBKeychainStoreAddManager<TCBKeychainStoreItemAttributeGenericPassword>(itemType: .genericPassword)
do {
    let passwordData = "test_account_password".data(using: .utf8)!
    try manager.addValue(for: .account, value: "test_account")
    try manager.addValue(for: .password, value: passwordData)
    
    let addResult = try manager.saveItem()
    print("\nAdd Status: \(addResult.description!)")
} catch {
    if let error = error as? TCBKeychainStoreStatus {
        print("manager: \(error.description!)")
    }
}
```

Sample constructor for updating an `Item` from the `Keychain`.
```Swift
var  manager = TCBKeychainStoreUpdateManager<TCBKeychainStoreItemAttributeGenericPassword, TCBKeychainStoreItemAttributeSearchQuery>(itemType: .genericPassword)        
do {
    let password = "test_account_password_\(Int.random(in: 0..<9999))"
    let passwordData = password.data(using: .utf8)!
    try manager.addQuery(for: .account, value: "test_account")

    try manager.addValueToUpdate(for: .password, value: passwordData)
    
    let updateResult = try manager.updateItem()
    print("\n\nUpdate Result: \(updateResult.description!)")
} catch {
    if let error = error as? TCBKeychainStoreStatus {
        print("\n\n manager: \(error.description!)")
    }
}
```

```Swift
var manager = TCBKeychainStoreSearchManager<TCBKeychainStoreItemAttributeGenericPassword, TCBKeychainStoreItemAttributeSearchQuery>(itemType: .genericPassword)
do {
    try manager.addSearchValue(for: .account, value: "test_account")
    
    // `TCBKeychainStoreItemReturnType` desired keychain item return format, this can be combine to each other availabl formats.
    /*
    // like so:
    manager.addReturnType(with: .attributes)
    manager.addReturnType(with: .data)
    manager.addReturnType(with: .reference)
    manager.addReturnType(with: .persistentReference)
    */
    // or
    manager.addReturnType(with: .attributes)
    
    let searchedResult = try manager.searchItem()
    print("\nFound Result: \(searchedResult)")
    
    if let searchedResult = searchedResult.item as? [String: Any], let pwdData = searchedResult[TCBKeychainStoreItemAttributeGenericPassword.password.attributeKey] as? Data, let password = String(data: pwdData, encoding: String.Encoding.utf8) {
        print("\n\nFound Password: \(password)")
    }
} catch {
    if let error = error as? TCBKeychainStoreStatus {
        print("\n\n manager: \(error.description!)")
    }
}
```

Sample constructor for deleting an `Item` from the `Keychain`.
```Swift
var manager = TCBKeychainStoreDeleteManager<TCBKeychainStoreItemAttributeGenericPassword, TCBKeychainStoreItemAttributeSearchQuery>(itemType: .genericPassword)
do {
    try manager.addQuery(for: .account, value: "test_account")
    
    let deleteResult = try manager.deleteItem()
    print("\n\nDelete Result: \(deleteResult.description!)")
} catch {
    if let error = error as? TCBKeychainStoreStatus {
        print("\n\n manager: \(error.description!)")
    }
}
```

## Author

Neil Francis Ramirez Hipona, nferocious76@gmail.com

## License

TCBKeychainManager is available under the MIT license. See the LICENSE file for more info.
