//
//  UINavigationProperties.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 14/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
let kNavBarTitleColor = "titleColor"

class UINavigationProperties {
    
    var titleColor: UIColor?
    
    init(navBarProperticesDict: Dictionary<String, Any>) {
        if navBarProperticesDict[kNavBarTitleColor] != nil {
            titleColor = navBarProperticesDict[kNavBarTitleColor] as? UIColor
        }
    }
}
