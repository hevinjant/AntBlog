//
//  PayWallViewController.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/4/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import UIKit

class PayWallViewController: UIViewController {

    private let header = PayWallHeaderView()
    
    private let descriptionView = PayWallDescriptionView()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Subscribe", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let restoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("Restore Purchase", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let termsView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.textAlignment = .center
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 14, weight: .thin)
        textView.text = "Terms of Service: This is an auto-renewable subscription."
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Get Premium"
        
        // add subviews
        view.addSubview(header)
        view.addSubview(buyButton)
        view.addSubview(restoreButton)
        view.addSubview(termsView)
        view.addSubview(descriptionView)
        
        setUpCloseButton()
        setUpButtons()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // assign frames
        header.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height/3.2)
        termsView.frame = CGRect(x: 10, y: view.height - 100, width: view.width - 20, height: 100)
        restoreButton.frame = CGRect(x: 25, y: termsView.top - 60, width: view.width - 50, height: 50)
        buyButton.frame = CGRect(x: 25, y: restoreButton.top - 60, width: view.width - 50, height: 50)
        descriptionView.frame = CGRect(x: 0, y: header.bottom, width: view.width, height: buyButton.top-view.safeAreaInsets.top-header.height)
    }
    
    private func setUpCloseButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
    }
    
    private func setUpButtons() {
        buyButton.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
        restoreButton.addTarget(self, action: #selector(didTapRestore), for: .touchUpInside)
    }
    
    @objc private func didTapSubscribe() {
//        IAPManager.shared.fetchPackages(completion: { package in
//            guard let package = package else { return }
//            IAPManager.shared.subscribe(package: package, completion: { [weak self] success in
//                print("Purchase: \(success)")
//                DispatchQueue.main.async {
//                    if success {
//                        self?.dismiss(animated: true, completion: nil)
//                    }
//                    else {
//                        let alert = UIAlertController(title: "Subscription Failed", message: "Unable to complete the transaction.", preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//                        self?.present(alert, animated: true, completion: nil)
//                    }
//                }
//            })
//        })
    }
    
    @objc private func didTapRestore() {
//        IAPManager.shared.restorePurchases(completion: { [weak self] success in
//            print("Restored: \(success)")
//            DispatchQueue.main.async {
//                if success {
//                    self?.dismiss(animated: true, completion: nil)
//                }
//                else {
//                    let alert = UIAlertController(title: "Failed to restore", message: "Unable to restore a previous transaction.", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
//                    self?.present(alert, animated: true, completion: nil)
//                }
//            }
//        })
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
}
