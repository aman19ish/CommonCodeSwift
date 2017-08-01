//
//  UIBttonCornerRadius.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 30/05/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIBttonCornerRadius: UIButtonBorder {
    
    //MARK:- Corner Radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    //MARK:- Button Make Circle
    @IBInspectable var makeCircle: Bool = false {
        didSet {
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
