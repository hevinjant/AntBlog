//
//  ProfileViewController.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/3/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(didTapSignOut))
    }
    
    @objc private func didTapSignOut() {
        
    }

}
