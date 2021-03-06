//
//  IAPManager.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/3/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import Foundation
import Purchases

final class IAPManager {
    static let shared = IAPManager()
    
    private init() {
        
    }
    
    func isPremium() -> Bool {
        return UserDefaults.standard.bool(forKey: "premium")
    }
    
    public func getSubscriptionStatus(completion: ((Bool) -> Void)?) {
        Purchases.shared.purchaserInfo({ info, error in
            guard let entitlements = info?.entitlements,
                error == nil else {
                    return
            }
            if entitlements.all["Premium"]?.isActive == true {
                UserDefaults.standard.set(true, forKey: "premium")
                completion?(true)
            }
            else {
                UserDefaults.standard.set(false, forKey: "premium")
                completion?(false)
            }
        })
    }
    
    public func fetchPackages(completion: @escaping (Purchases.Package?) -> Void) {
        Purchases.shared.offerings({ offerings, error in
            guard let package = offerings?.offering(identifier: "default")?.availablePackages.first,
                error == nil else {
                completion(nil)
                return
            }
            completion(package)
        })
    }
    
    public func subscribe(package: Purchases.Package, completion: @escaping (Bool) -> Void) {
        guard !isPremium() else {
            print("User has already subscribed.")
            completion(true)
            return
        }
        
        Purchases.shared.purchasePackage(package, { transaction, info, error, userCancelled in
            guard let transaction = transaction,
                let entitlements = info?.entitlements,
                error == nil,
                !userCancelled else {
                    return
            }
            
            switch transaction.transactionState {
                
            case .purchasing:
                print("purchasing")
            case .purchased:
                if entitlements.all["Premium"]?.isActive == true {
                    print("purchased")
                    UserDefaults.standard.set(true, forKey: "premium")
                    completion(true)
                }
                else {
                    print("purchase failed")
                    UserDefaults.standard.set(false, forKey: "premium")
                    completion(false)
                }
            case .failed:
                print("failed")
            case .restored:
                print("restored")
            case .deferred:
                print("deffered")
            @unknown default:
                print("default")
            }
        })
    }
    
    func restorePurchases(completion: @escaping (Bool) -> Void) {
        Purchases.shared.restoreTransactions({ info, error in
            guard let entitlements = info?.entitlements,
                error == nil else {
                    return
            }
            
            if entitlements.all["Premium"]?.isActive == true {
                UserDefaults.standard.set(true, forKey: "premium")
                completion(true)
            }
            else {
                UserDefaults.standard.set(false, forKey: "premium")
                completion(false)
            }
        })
    }
}
