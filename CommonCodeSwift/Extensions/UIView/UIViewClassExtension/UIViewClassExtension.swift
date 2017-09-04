//
//  UIViewClassExtension.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 13/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIViewClassExtension: UIViewBorder {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func layoutSubviews() {
        super.layoutSubviews()
        if makeCircle {
            layer.cornerRadius = self.bounds.size.width / 2
            clipsToBounds = true
        }
    }

}
