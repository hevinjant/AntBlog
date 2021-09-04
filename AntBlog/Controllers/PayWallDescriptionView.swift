//
//  PayWallDescriptionView.swift
//  AntBlog
//
//  Created by Hevin Jant on 9/4/21.
//  Copyright © 2021 Hevin Jant. All rights reserved.
//

import UIKit

class PayWallDescriptionView: UIView {

    private let descriptorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20,weight: .medium)
        label.numberOfLines = 0
        label.text = "Join our premium membership to get unlimited articles."
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18,weight: .thin)
        label.numberOfLines = 1
        label.text = "$4.99 / month"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        
        // add subviews
        addSubview(priceLabel)
        addSubview(descriptorLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // assign frames
        descriptorLabel.frame = CGRect(x: 20, y: 0, width: width-40, height: height/2)
        priceLabel.frame = CGRect(x: 20, y: height/2, width: width-40, height: height/2)
    }
}
