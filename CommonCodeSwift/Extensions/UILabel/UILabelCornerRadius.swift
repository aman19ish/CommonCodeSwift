//
//  UILabelCornerRadius.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 05/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UILabelCornerRadius: UILabelBorder {

    //MARK:- Corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
