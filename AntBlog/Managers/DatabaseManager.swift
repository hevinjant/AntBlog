//
//  DatabaseManager.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/3/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import Foundation
import FirebaseFirestore

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Firestore.firestore()
    
    private init() {
        
    }
    
    public func insert(blogPost: BlogPost, user: User, completion: @escaping (Bool) -> Void) {
        
    }
    
    public func getAllPosts(completion: @escaping ([BlogPost]) -> Void) {
        
    }
    
    public func getPosts(for user: User, completion: @escaping ([BlogPost]) -> Void) {
        
    }
    
    public func insert(user: User, completion: @escaping (Bool) -> Void) {
        
    }
}
