//
//  UITableViewCellExtension.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 03/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    /*  This function is olny work when
     cell class name and identifier name is same.
     */
    
    //MARK:- Get Identifier
    static func getCellIdentifier() -> String
    {
        return String(describing: self)
    }
}
