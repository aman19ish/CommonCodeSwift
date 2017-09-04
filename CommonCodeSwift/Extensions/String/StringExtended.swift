//
//  StringExtended.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 03/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import Foundation

extension String {
    // MARK: - Public variables
    var first: String {
        return String(characters.prefix(1))
    }
    
    var last: String {
        return String(characters.suffix(1))
    }
    
    var uppercaseFirstChar: String {
        return first.uppercased() + String(characters.dropFirst())
    }
    
    var vowels: [String] {
        get {
            return ["a", "e", "i", "o", "u"]
        }
    }
    
    var consonants: [String] {
        get {
            return ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"]
        }
    }
    
    var length: Int {
        get {
            return self.stringByTrimmingWhiteSpaceAndNewLine().characters.count
        }
    }
    
    //To check whether email is valid or not
    func isEmail() -> Bool {
        if self.isEmptyString() {
            return false
        }
        let emailRegex = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}" as String
        let emailText = NSPredicate(format: "SELF MATCHES %@",emailRegex)
        let isValid  = emailText.evaluate(with: self) as Bool
        return isValid
    }
    
    //To check whether URL is valid
    func isURL() -> Bool {
        let urlRegex = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+" as String
        let urlText = NSPredicate(format: "SELF MATCHES %@", urlRegex)
        let isValid = urlText.evaluate(with: self) as Bool
        return isValid
    }
    
    //To check whether image URL is valid
    func isImageURL() -> Bool {
        if self.isURL() {
            if self.range(of: ".png") != nil || self.range(of: ".jpg") != nil || self.range(of: ".jpeg") != nil {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    //To check whether string is empty
    func isEmptyString() -> Bool {
        return self.stringByTrimmingWhiteSpace().characters.count == 0 ? true : false
    }
    
    //Get string by removing white space
    func stringByTrimmingWhiteSpace() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    //Get string by removing white space & new line
    func stringByTrimmingWhiteSpaceAndNewLine() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    //Remove substring in string
    mutating func removeSubString(subString: String) -> String {
        if self.contains(subString) {
            guard let stringRange = self.range(of: subString) else { return self }
            return self.replacingCharacters(in: stringRange, with: "")
        }
        return self
    }
    
    static func getString(message: Any?) -> String {
        guard let strMessage = message as? String else {
            guard let doubleValue = message as? Double else {
                guard let intValue = message as? Int else {
                    guard let int64Value = message as? Int64 else {
                        return ""
                    }
                    return String(int64Value)
                }
                return String(intValue)
            }
            
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            formatter.minimumIntegerDigits = 1
            guard let formattedNumber = formatter.string(from: NSNumber(value: doubleValue)) else {
                return ""
            }
            return formattedNumber
        }
        return strMessage.stringByTrimmingWhiteSpaceAndNewLine()
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    
    //Get character array by string
    func getArrayByString() -> [Character] {
        return Array(self.characters)
    }
    
}

