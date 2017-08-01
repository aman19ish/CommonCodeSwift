//
//  AGDatePicker.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 01/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit

let datePickerTopMargin: CGFloat = 0
let pickerTopMargin: CGFloat = 0

class AGDatePicker: UIView {
    //MARK:- Closures
    private var callBack = {(response: Any?) -> () in
    }
    
    //MARK:- Public Variables
    var pickerView: UIDatePicker!
    var viewContainer: UIView!
    
    //MARK:- Initializer Methods
    convenience init(view: UIView, pickerMode mode: UIDatePickerMode, handler completionBlock: @escaping (_ response: Any?) -> ()) {
        UIApplication.shared.delegate?.window!?.endEditing(true)
        
        let rect = view.bounds
        self.init(frame: rect)
        
        let viewHt = rect.size.height
        let cHt = 201
        let yValue = viewHt - CGFloat(cHt) - pickerTopMargin
        
        viewContainer = UIView(frame: CGRect(x: 0, y: viewHt, width: UIScreen.main.bounds.width, height: CGFloat(cHt)))
        
        pickerView = UIDatePicker(frame: CGRect(x: 2, y: 35, width: UIScreen.main.bounds.width, height: 162))
        pickerView.date = Date()
        pickerView.datePickerMode = mode
        viewContainer.addSubview(pickerView)
        
        let viewHeader = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        viewHeader.backgroundColor = UIColor(colorLiteralRed: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        
        let btnCancel = getButton(xValue: 1.0, buttonTitle: "Cancel")
        viewHeader.addSubview(btnCancel)
        
        let btnDone = getButton(xValue: UIScreen.main.bounds.width - 71.0, buttonTitle: "Done")
        viewHeader.addSubview(btnDone)
        
        viewContainer.addSubview(viewHeader)
        self.addSubview(viewContainer)
        
        view.addSubview(self)
        callBack = completionBlock
        
        UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState, animations: {
            var frame = self.viewContainer.frame
            frame.origin.y = yValue
            self.viewContainer.frame = frame
        }, completion: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Private Methods
    private func getButton(xValue: CGFloat, buttonTitle title: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: xValue, y: 1, width: 70, height: 35)
        
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        if (title == "Cancel") {
            button.addTarget(self, action: #selector(tapCancel(sender:)), for: .touchUpInside)
        } else {
            button.addTarget(self, action: #selector(tapDone(sender:)), for: .touchUpInside)
        }
        return button
    }
    
    //MARK:- Public Methods
    func setMinimumDate(date: Date) {
        pickerView.minimumDate = date
    }
    
    func setMaximumDate(date: Date) {
        pickerView.maximumDate = date
    }
    
    func setCurrentDate(date: Date) {
        pickerView.date = date
    }
    
    //MARK:- IBAction Methods
    func tapCancel(sender: UIButton) {
        UIApplication.shared.delegate?.window!?.endEditing(true)
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState, animations: {
            var frame = self.viewContainer.frame
            frame.origin.y = self.frame.size.height
            self.viewContainer.frame = frame
        }) { (finished) in
            self.callBack(nil)
            self.removeFromSuperview()
        }
    }
    
    func tapDone(sender: UIButton) {
        UIView.animateKeyframes(withDuration: 0.25, delay: 0.0, options: .beginFromCurrentState, animations: {
            var frame = self.viewContainer.frame
            frame.origin.y = self.frame.size.height
            self.viewContainer.frame = frame
        })
        { (finished) in
            if finished {
                UIApplication.shared.delegate?.window!?.endEditing(true)
                self.callBack(self.pickerView?.date)
                self.removeFromSuperview()
            }
        }
    }
}
