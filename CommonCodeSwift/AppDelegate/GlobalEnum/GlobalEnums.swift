//
//  GlobalEnums.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 20/06/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import Foundation
import UIKit

enum CellIndexPath_Row: Int {
    case Zero = 0
    case One = 1
    case Two = 2
    case Three = 3
    case Four = 4
    case Five = 5
    case Six = 6
    case Seven = 7
    case Eight = 8
    case Nine = 9
    case Ten = 10
}

enum CellIndexPath_Section: Int {
    case Zero = 0
    case One = 1
    case Two = 2
    case Three = 3
    case Four = 4
    case Five = 5
    case Six = 6
    case Seven = 7
    case Eight = 8
    case Nine = 9
    case Ten = 10
}

enum CellIndexPath_Item: Int {
    case Zero = 0
    case One = 1
    case Two = 2
    case Three = 3
    case Four = 4
    case Five = 5
    case Six = 6
    case Seven = 7
    case Eight = 8
    case Nine = 9
    case Ten = 10
}

enum SuccessResult {
    case Canceled
    case Scucess
    case Failed
}


enum FontType {
    case Default(size: CGFloat) , Small(size: CGFloat), Large(size: CGFloat)
    
    var fount: UIFont {
        switch self {
        case .Default(let size):
            return UIFont.systemFont(ofSize: size)
        case .Small(let size):
            return UIFont.systemFont(ofSize: size)
        case .Large(let size):
            return UIFont.systemFont(ofSize: size)
        }
    }
    
    static func getFont(rawValue: Int, fontSize: CGFloat) -> UIFont  {
        return FontType.Default(size: fontSize).fount
    }
}
