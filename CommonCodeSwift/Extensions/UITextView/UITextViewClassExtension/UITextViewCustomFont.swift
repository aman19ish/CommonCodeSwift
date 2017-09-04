//
//  UITextViewCustomFont.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 04/09/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UITextViewCustomFont: UITextView {
    @IBInspectable var fontSize: CGFloat = 18 {
        didSet {
        }
    }
    
    @IBInspectable var fontTypeInterger: Int = 0 {
        didSet {
        }
    }
}
