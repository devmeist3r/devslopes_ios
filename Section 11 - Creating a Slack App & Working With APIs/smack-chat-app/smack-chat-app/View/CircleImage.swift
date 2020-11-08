//
//  CircleImage.swift
//  smack-chat-app
//
//  Created by Lucas Inocencio on 31/07/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
