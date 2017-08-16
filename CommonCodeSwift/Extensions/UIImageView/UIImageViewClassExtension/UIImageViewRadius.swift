//
//  UIImageViewRadius.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 05/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIImageViewRadius: UIImageViewBorder {

    //MARk:- Corner radius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    //MARK:- As per screen width make cirle image
    @IBInspectable var asPerWidthMakeCircle: CGFloat = 0 {
        didSet {
            layer.cornerRadius = (asPerWidthMakeCircle * UIScreen.main.bounds.size.width) / 2
            layer.masksToBounds = asPerWidthMakeCircle > 0
        }
    }
    
    //MARK:- Make cirle image
    @IBInspectable var makeCircle: Bool = false {
        didSet {
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    //MARK:- Deafult override methods
    override func layoutSubviews() {
        if makeCircle {
            layer.cornerRadius = self.bounds.size.width / 2
            clipsToBounds = true
        }
    }

}
