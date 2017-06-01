//
//  UIButtonBorder.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 30/05/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIButtonBorder: UIButtonShadowBorder {

    //MARK:- Border Width
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    //MARK:-Border Color
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
}
