//
//  AuthManager.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/3/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    static let shared = AuthManager()
    
    private let auth = Auth.auth()
    
    private init() {
        
    }
    
    public var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    public func signUp(email: String, password: String, completionHandler: @escaping (Bool) -> Void) {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty,
            password.count >= 6 else {
                return
        }
        
        auth.createUser(withEmail: email, password: password, completion: { result, error in
            guard result != nil, error == nil else {
                completionHandler(false)
                print("Error Signing up: \(error)")
                return
            }
            completionHandler(true)
        })
    }
    
    public func signIn(email: String, password: String, completionHandler: @escaping (Bool) -> Void) {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
            !password.trimmingCharacters(in: .whitespaces).isEmpty,
            password.count >= 6 else {
                return
        }
        
        auth.signIn(withEmail: email, password: password, completion: { result, error in
            guard result != nil, error == nil else {
                completionHandler(false)
                return
            }
            completionHandler(true)
        })
    }
    
    public func signOut(completionHandler: (Bool) -> Void) {
        do {
            try auth.signOut()
            completionHandler(true)
        }
        catch {
            print(error)
            completionHandler(false)
        }
    }
}
