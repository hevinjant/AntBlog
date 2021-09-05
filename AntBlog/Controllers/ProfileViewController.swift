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
        let sheet = UIAlertController(title: "Sign Out", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            AuthManager.shared.signOut { [weak self] success in
                DispatchQueue.main.async {
                    // Clear user's cache
                    UserDefaults.standard.set(nil, forKey: "email")
                    UserDefaults.standard.set(nil, forKey: "name")
                    
                    let signInVC = SignInViewController()
                    signInVC.navigationItem.largeTitleDisplayMode = .always
                    
                    let navVC = UINavigationController(rootViewController: signInVC)
                    navVC.navigationBar.prefersLargeTitles = true
                    navVC.modalPresentationStyle = .fullScreen
                    
                    self?.present(navVC, animated: true, completion: nil)
                }
            }
        }))
        present(sheet, animated: true)
    }

}
