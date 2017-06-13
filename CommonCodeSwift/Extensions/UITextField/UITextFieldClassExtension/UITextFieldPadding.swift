//
//  UITextFieldPadding.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 13/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UITextFieldPadding: UITextField {
    
    //MARK:- Left padding
    @IBInspectable var leftPaddingWidth: CGFloat = 0.0 {
        didSet
        {
            let viewLeft = UIView(frame: CGRect.init(x: 0, y: 0, width: leftPaddingWidth, height: self.frame.size.height))
            self.leftView = viewLeft
            self.leftViewMode = .always
        }
    }
    
    /*
     Left Padding view image height and width is fixed (32,32)
    */
    
    @IBInspectable var leftPaddingViewImage: UIImage? {
        didSet
        {
            if leftPaddingViewImage != nil
            {
                let viewLeft = UIView(frame: CGRect.init(x: 0, y: 0, width: 32.0, height: 32.0))
                
                let imgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: viewLeft.frame.size.height, height: viewLeft.frame.size.height))
                imgView.contentMode = .center
                imgView.image = leftPaddingViewImage
                viewLeft.addSubview(imgView)
                
                self.leftView = viewLeft
                self.leftViewMode = .always
            }
        }
    }
    
    /*
     Right Padding view image height and width is fixed (32,32)
     */
    @IBInspectable var leftPaddingText: String? {
        didSet
        {
            if leftPaddingText != nil
            {
                let viewLeft = UIView(frame: CGRect.init(x: 0, y: 0, width: 32.0, height: 32.0))
                
                let lblLeftText = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: viewLeft.frame.size.height, height: viewLeft.frame.size.height))
                lblLeftText.text = leftPaddingText
                lblLeftText.font = UIFont.init(name: "HelveticaNeue", size: 14.0)
                viewLeft.addSubview(lblLeftText)
                
                self.leftView = viewLeft
                self.leftViewMode = .always
            }
        }
    }

    //MARK:- Right padding
    @IBInspectable var rightPaddingViewImage: UIImage? {
        didSet
        {
            if rightPaddingViewImage != nil
            {
                let viewRight = UIView(frame: CGRect.init(x: UIScreen.main.bounds.size.width - 80.0, y: 0, width: 40.0, height: 40.0))
                
                let imgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: viewRight.frame.size.height, height: viewRight.frame.size.height))
                imgView.contentMode = .center
                imgView.image = rightPaddingViewImage
                viewRight.addSubview(imgView)
                
                self.rightView = viewRight
                self.rightViewMode = .always
            }
        }
    }
}
