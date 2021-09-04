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
        return false
    }
    
    func subscribe() {
        
    }
    
    func restorePurchases() {
        
    }
}
