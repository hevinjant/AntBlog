//
//  SignInViewController.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/3/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign In"
        view.backgroundColor = .systemBackground
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            if !IAPManager.shared.isPremium() {
                let vc = PayWallViewController()
                let navVC = UINavigationController(rootViewController: vc)
                self.present(navVC, animated: true, completion: nil)
            }
        }
    }
}
