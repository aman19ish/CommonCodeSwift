//
//  NSMutableAttributedStringExtended.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 03/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString
{
    func bold(_ text: String, font: UIFont) -> NSMutableAttributedString {
        let attribute:[String:AnyObject] = [NSFontAttributeName : font]
        let boldString = NSMutableAttributedString(string: "\(text)", attributes: attribute)
        self.append(boldString)
        return self
    }
    
    func normal(_ text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.append(normal)
        return self
    }
    
}
