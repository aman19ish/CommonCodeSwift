//
//  UICollecionViewCellExtension.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 13/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit

extension UICollectionViewCell
{
    /*  This function is olny work when
     cell class name and identifier name is same.
     */

    //MARK:- Get Identifier
    static func getCellIdentifier() -> String
    {
        return String(describing: self)
    }
}


