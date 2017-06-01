//
//  UIButtonSublayer.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 01/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
@IBDesignable

class UIButtonSublayer: UIBttonCornerRadius {
    
    //MARK:- Sublayer variables
    @IBInspectable var sublayerBorderWidth: CGFloat = 1 {
        didSet
        {
        }
    }
    
    @IBInspectable var sublayerBorderColorSelected: UIColor? {
        didSet
        {
        }
    }
    
    @IBInspectable var sublayerBorderColorNormal: UIColor? {
        didSet
        {
        }
    }
    
    @IBInspectable var leftSublayer: Bool = false {
        didSet
        {
        }
    }
    
    @IBInspectable var rightSublayer: Bool = false {
        didSet
        {
        }
    }
    
    @IBInspectable var bottomSublayer: Bool = false {
        didSet
        {
        }
    }
    
    @IBInspectable var topSublayer: Bool = false {
        didSet
        {
        }
    }
    
    //MARK:- Deafult override methods
    override func layoutSubviews()
    {
        super.layoutSubviews()
        if leftSublayer
        {
            setLeftBorderWithCALayer()
        }
        if rightSublayer
        {
            setRightBorderWithCALayer()
        }
        if bottomSublayer
        {
            setBottomBorderWithCALayer()
        }
        if topSublayer
        {
            setTopBorderWithCALayer()
        }
        if makeCircle
        {
            layer.cornerRadius = self.bounds.size.width / 2
            clipsToBounds = true
        }
    }
    
    //MARK:- Set variables methods
    fileprivate func setLeftBorderWithCALayer()
    {
        let border = CALayer()
        border.backgroundColor = self.isSelected ? sublayerBorderColorSelected?.cgColor : sublayerBorderColorNormal?.cgColor
        border.frame = CGRect(x: 0, y: 0, width: sublayerBorderWidth, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    fileprivate func setRightBorderWithCALayer()
    {
        let border = CALayer()
        border.backgroundColor = self.isSelected ? sublayerBorderColorSelected?.cgColor : sublayerBorderColorNormal?.cgColor
        border.frame = CGRect(x: self.frame.size.width - sublayerBorderWidth, y: 0, width: sublayerBorderWidth, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    fileprivate func setTopBorderWithCALayer()
    {
        let border = CALayer()
        border.backgroundColor = self.isSelected ? sublayerBorderColorSelected?.cgColor : sublayerBorderColorNormal?.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: sublayerBorderWidth)
        self.layer.addSublayer(border)
    }
    
    fileprivate func setBottomBorderWithCALayer()
    {
        let border = CALayer()
        border.backgroundColor = self.isSelected ? sublayerBorderColorSelected?.cgColor : sublayerBorderColorNormal?.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - sublayerBorderWidth, width: self.frame.size.width, height: sublayerBorderWidth)
        self.layer.addSublayer(border)
    }
    
}
