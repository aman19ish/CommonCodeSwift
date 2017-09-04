//
//  UIButtonCornerRadius.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 04/09/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIButtonCornerRadius: UIButtonBorder {
    // MARK: - Corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    //MARK : - Button make circle
    @IBInspectable var makeCircle: Bool = false {
        didSet {
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
}
