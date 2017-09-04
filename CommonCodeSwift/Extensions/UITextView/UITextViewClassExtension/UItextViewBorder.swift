//
//  UItextViewBorder.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 13/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UItextViewBorder: UITextViewCustomFont {
    // MARK: - TextView border
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
