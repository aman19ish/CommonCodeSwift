//
//  UIImageViewBorder.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 05/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIImageViewBorder: UIImageView {
    
    //MARK:- UIImageBorder
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
}
