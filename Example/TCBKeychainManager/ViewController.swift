//
//  ViewController.swift
//  TCBKeychainManager
//
//  Created by Neil Francis Ramirez Hipona on 02/20/2022.
//  Copyright (c) 2022 Neil Francis Ramirez Hipona. All rights reserved.
//

import UIKit
import TCBKeychainManager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addTest()
        updateTest()
        deleteTest()
    }

    func addTest() {
        // ADD TEST
        var addManager = TCBKeychainStoreAddManager<TCBKeychainStoreItemAttributeGenericPassword>(itemType: .genericPassword)
        do {
            let passwordData = "test_account_password".data(using: .utf8)!
            try addManager.addValue(for: .account, value: "test_account")
            try addManager.addValue(for: .password, value: passwordData)
            
            let addResult = try addManager.saveItem()
            print("\nAdd Status: \(addResult.description!)")
        } catch {
            if let error = error as? TCBKeychainStoreStatus {
                print("addManager: \(error.description!)")
            }
        }
        
        // RETRIEVE TEST
        var retrieveManager = TCBKeychainStoreSearchManager<TCBKeychainStoreItemAttributeGenericPassword, TCBKeychainStoreItemAttributeSearchQuery>(itemType: .genericPassword)
        
        do {
            let passwordData = "test_account_password".data(using: .utf8)!
            try retrieveManager.addSearchValue(for: .account, value: "test_account")
            try retrieveManager.addSearchValue(for: .password, value: passwordData)
            
            retrieveManager.addReturnType(with: .attributes)
            retrieveManager.addReturnType(with: .data)
            retrieveManager.addReturnType(with: .reference)
            retrieveManager.addReturnType(with: .persistentReference)
            
            let searchedResult = try retrieveManager.searchItem()
            print("\nSearched Status: \(searchedResult.description!)")
            
            if let searchedResult = searchedResult.item as? [String: Any], let pwdData = searchedResult[TCBKeychainStoreItemAttributeGenericPassword.password.attributeKey] as? Data, let password = String(data: pwdData, encoding: String.Encoding.utf8) {
                print("Searched Found Password: \(password)")
            }
        } catch {
            if let error = error as? TCBKeychainStoreStatus {
                print("\n\n retrieveManager: \(error.description!)")
            }
        }
    }
    
    func updateTest() {
        // UPDATE TEST
        var  updateManager = TCBKeychainStoreUpdateManager<TCBKeychainStoreItemAttributeGenericPassword, TCBKeychainStoreItemAttributeSearchQuery>(itemType: .genericPassword)
        
        do {
            let password = "test_account_password_\(Int.random(in: 0..<9999))"
            let passwordData = password.data(using: .utf8)!
            try updateManager.addQuery(for: .account, value: "test_account")
                        
            try updateManager.addValueToUpdate(for: .password, value: passwordData)
            
            let updateResult = try updateManager.updateItem()
            print("\n\nUpdate Result: \(updateResult.description!) -- pwd: \(password)")
        } catch {
            if let error = error as? TCBKeychainStoreStatus {
                print("\n\n updateManager: \(error.description!)")
            }
        }
        
        // RETRIEVE TEST
        var retrieveUpdatedManager = TCBKeychainStoreSearchManager<TCBKeychainStoreItemAttributeGenericPassword, TCBKeychainStoreItemAttributeSearchQuery>(itemType: .genericPassword)
        
        do {
            try retrieveUpdatedManager.addSearchValue(for: .account, value: "test_account")
            
            retrieveUpdatedManager.addReturnType(with: .attributes)
            retrieveUpdatedManager.addReturnType(with: .data)
            retrieveUpdatedManager.addReturnType(with: .reference)
            retrieveUpdatedManager.addReturnType(with: .persistentReference)
            
            let searchedResult = try retrieveUpdatedManager.searchItem()
            print("\nFound Updated: \(searchedResult)")
            
            if let searchedResult = searchedResult.item as? [String: Any], let pwdData = searchedResult[TCBKeychainStoreItemAttributeGenericPassword.password.attributeKey] as? Data, let password = String(data: pwdData, encoding: String.Encoding.utf8) {
                print("\n\nFound Updated Password: \(password)")
            }
        } catch {
            if let error = error as? TCBKeychainStoreStatus {
                print("\n\n retrieveUpdatedManager: \(error.description!)")
            }
        }
    }
    
    func deleteTest() {
        
        // DELETE TEST
        var deleteManager = TCBKeychainStoreDeleteManager<TCBKeychainStoreItemAttributeGenericPassword, TCBKeychainStoreItemAttributeSearchQuery>(itemType: .genericPassword)
        
        do {
            try deleteManager.addQuery(for: .account, value: "test_account")
            
            let deleteResult = try deleteManager.deleteItem()
            print("\n\nDelete Result: \(deleteResult.description!)")
        } catch {
            if let error = error as? TCBKeychainStoreStatus {
                print("\n\n deleteManager: \(error.description!)")
            }
        }
        
        // RETRIEVE TEST
        var retrieveUpdatedManager = TCBKeychainStoreSearchManager<TCBKeychainStoreItemAttributeGenericPassword, TCBKeychainStoreItemAttributeSearchQuery>(itemType: .genericPassword)
        
        do {
            try retrieveUpdatedManager.addSearchValue(for: .account, value: "test_account")
            
            retrieveUpdatedManager.addReturnType(with: .attributes)
            retrieveUpdatedManager.addReturnType(with: .data)
            retrieveUpdatedManager.addReturnType(with: .reference)
            retrieveUpdatedManager.addReturnType(with: .persistentReference)
            
            let searchedResult = try retrieveUpdatedManager.searchItem()
            print("\nDeleted Found Updated: \(searchedResult)")
            
            if let searchedResult = searchedResult.item as? [String: Any], let pwdData = searchedResult[TCBKeychainStoreItemAttributeGenericPassword.password.attributeKey] as? Data, let password = String(data: pwdData, encoding: String.Encoding.utf8) {
                print("\n\nFound Deleted Password: \(password)")
            }
        } catch {
            if let error = error as? TCBKeychainStoreStatus {
                print("\n\n retrieveDeletedManager: \(error.description!)")
            }
        }
    }
}

