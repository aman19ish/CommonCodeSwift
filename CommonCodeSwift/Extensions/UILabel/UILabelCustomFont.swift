//
//  UILabelCustomFont.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 23/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UILabelCustomFont: UILabel {
    
    @IBInspectable var fontSize: CGFloat = 18 {
        didSet {
        }
    }
    
    @IBInspectable var fontTypeInterger: Int = 0 {
        didSet {
        }
    }
    
    override func layoutSubviews() {
        font = FontType.getFont(rawValue: fontTypeInterger, fontSize: fontSize)
    }

}
