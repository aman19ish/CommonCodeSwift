//
//  UITextFieldBorder.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 13/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UITextFieldBorder: UITextFieldPadding {

    //MARK:- TextField Border width and color
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
