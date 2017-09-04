//
//  UIButtonShadowBorder.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 01/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIButtonShadowBorder: UIButtonCustomFont {
    // MARK: - Shadow radius variables
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowOffset = CGSize.init(width: 0.1, height: 0.1)
            layer.shadowRadius = shadowRadius
            layer.shadowOpacity = 1.0
        }
    }
    
    @IBInspectable var masksToBounds: Bool = false {
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
    
    @IBInspectable var shodowColor: UIColor? {
        didSet {
            layer.shadowColor = shodowColor?.cgColor
        }
    }
    
}
