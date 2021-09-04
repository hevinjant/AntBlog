//
//  TabBarViewController.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/3/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpControllers()
    }
    
    private func setUpControllers() {
        let home = HomeViewController()
        home.title = "Home"
        home.navigationItem.largeTitleDisplayMode = .always
        
        let profile = ProfileViewController()
        profile.title = "Profile"
        profile.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: home)
        nav1.navigationBar.prefersLargeTitles = true
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        
        let nav2 = UINavigationController(rootViewController: profile)
        nav2.navigationBar.prefersLargeTitles = true
        nav2.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        
        setViewControllers([nav1, nav2], animated: true)
    }
}
