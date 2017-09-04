//
//  UIViewBorder.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 13/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIViewBorder: UIView {
    // MARK: - View border
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
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var makeCircle: Bool = false {
        didSet {
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var asPerWidthMakeCircle: CGFloat = 0 {
        didSet {
            layer.cornerRadius = (asPerWidthMakeCircle * UIScreen.main.bounds.size.width) / 2
            layer.masksToBounds = asPerWidthMakeCircle > 0
        }
    }

}
