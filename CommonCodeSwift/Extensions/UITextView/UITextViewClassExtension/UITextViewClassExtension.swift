//
//  UITextViewClassExtension.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 13/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UITextViewClassExtension: UItextViewBorder {
    /**
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.textContainerInset = UIEdgeInsets.init(top: self.borderWidth, left: 0 , bottom: self.borderWidth, right: 0);
        self.textContainer.lineFragmentPadding = self.borderWidth;
    }
    
}
