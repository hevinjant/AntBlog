//
//  BlogPost.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/3/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import Foundation

struct BlogPost {
    let identifier: String
    let title: String
    let timestamp: TimeInterval
    let headerImageUrl: URL?
    let text: String
}
