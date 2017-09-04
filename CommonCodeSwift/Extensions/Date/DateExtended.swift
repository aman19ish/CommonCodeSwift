//
//  DateExtended.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 08/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import Foundation

let D_Second = 1.0
let D_Minute =  D_Second * 60.0
let D_Hour = D_Minute * 60.0
let D_Day = D_Hour * 24
let D_Week = D_Day * 7
let D_Year = 31556926.0

extension Date {
    // MARK: - Class methods
    static func currentCalendar() -> Calendar {
        var sharedCalendar: Calendar? = nil
        if (sharedCalendar == nil) {
            sharedCalendar = Calendar.autoupdatingCurrent
        }
        return sharedCalendar!
    }
    
    
    func dateByAddingMonth(month: NSInteger) -> Date
    {
        var dateComponents = DateComponents()
        dateComponents.month = month
        
        let newDate = Calendar.current.date(byAdding: dateComponents, to: self, wrappingComponents: true)
        return newDate!
    }
    
}
