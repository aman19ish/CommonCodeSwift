//
//  UINaviagtionExtension.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 11/08/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit
import Foundation

// MARK: - Enums
enum LeftBarItem {
    case back
    case menu
    case down
    case text
    case custom
    case none
}

enum RightBarItem {
    case text
    case textAndIcon
    case oneIcon
    case twoIcon
    case threeIcon
    case none
}

enum NavigationBarButton {
    case back
    case menu
    case leftDown
    case leftText
    case custom
    case rightText
    case rightFirst
    case rightSecond
    case rightThird
    case notification
}

struct NavigationProperties {
    var titleColor: UIColor! = UIColor.black
    var titleFont: UIFont! = UIFont.systemFont(ofSize: 15.0)
}

// MARK: - Delegate
protocol UINCExtendedDelegate: UINavigationControllerDelegate {
    func navigationBarButtonItemClicked(_ buttonType: NavigationBarButton, sender: UIButton)
}

private var navigationButton: UINCExtendedDelegate?
private var pro: UINavigationProperties?

extension UINavigationController: UINavigationControllerDelegate {
    // MARK: - View life cycle methods
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    var customDelegate: UINCExtendedDelegate? {
        get {
            return objc_getAssociatedObject(self, &navigationButton) as? UINCExtendedDelegate
        } set (newValue) {
            objc_setAssociatedObject(self, &navigationButton, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    // MARK: - Public methods
    func setupNavigationBar(navItem: UINavigationItem, title: String, leftBarButtonType: LeftBarItem, rightBarItemType: RightBarItem, rightBarTitle: String?, arrRightBarImages: [String]?) {
        let properties = NavigationProperties()
        self.interactivePopGestureRecognizer?.isEnabled = true
        navItem.title = title
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : properties.titleColor ,NSFontAttributeName: properties.titleFont]
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        let negativeSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        negativeSpace.width = -16.0
        
        var leftBarItems = [UIBarButtonItem]()
        
        //LeftBar button initialization
        switch leftBarButtonType {
        case .back:
            leftBarItems.append(getBarButton(withImage: "back", andSelector: #selector(clickBackButton(sender:))))
            
        case .menu:
            leftBarItems.append(getBarButton(withImage: "menu", andSelector: #selector(clickMenuButton(sender:))))
            
        case .text:
            let leftBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(clickLBButtonWithText(sender:)))
            leftBarButton.tintColor = UIColor.black
            leftBarItems.append(leftBarButton)
            
        case .custom:
            leftBarItems.append(getBarButton(withImage: "back", andSelector: #selector(clickCustomBackButton(sender:))))
            
        case .none:
            break
            
        default :
            break
        }
        leftBarItems.insert(negativeSpace, at: 0)
        navItem.leftBarButtonItems = leftBarItems
        
        var rightBarItems = [UIBarButtonItem]()

        //RightBar button initialization
        switch rightBarItemType {
        case .text:
            let rightBarButton = UIBarButtonItem(title: rightBarTitle, style: .done, target: self, action: #selector(clickRBButtonWithText(sender:)))
            rightBarButton.tintColor = UIColor.black
            rightBarButton.setTitleTextAttributes([NSFontAttributeName: properties.titleFont ?? UIFont.systemFont(ofSize: 14.0)], for: .normal)
            rightBarItems.append(rightBarButton)
            
        case .textAndIcon:
            break
            
        case .oneIcon:
            rightBarItems.append(getBarButton(withImage: "\(String(describing: arrRightBarImages?.first))" , andSelector: #selector(clickFirstRBButton(sender:))))
            
        case .twoIcon:
            rightBarItems.append(getBarButton(withImage: (arrRightBarImages?.first)!, andSelector: #selector(clickFirstRBButton(sender:))))
            rightBarItems.append(getSecondBarButton(withImage: (arrRightBarImages?[1])!, andSelector: #selector(clickSecondRBButton(sender:))))
            
        case .threeIcon:
            rightBarItems.append(getBarButton(withImage: (arrRightBarImages?.first)!, andSelector: #selector(clickFirstRBButton(sender:))))
            rightBarItems.append(getSecondBarButton(withImage: (arrRightBarImages?[1])!, andSelector: #selector(clickSecondRBButton(sender:))))
            rightBarItems.append(getThirdBarButton(withImage: (arrRightBarImages?[2])!, andSelector: #selector(clickThirdRBButton(sender:))))
//            let item1 = UIBarButtonItem(image: UIImage(named: (arrRightBarImages?[2])!), style: .plain, target: self, action: #selector(clickThirdRBButton(sender:)))
//            item1.width = 40.0
//            rightBarItems.append(item1)
            
        case .none:
            rightBarItems = []
            break
        }
        
        if rightBarItemType != .text && rightBarItems.count > 0 {
            rightBarItems.insert(negativeSpace, at: 0)
        }
        navItem.rightBarButtonItems = rightBarItems

    }
    
    func setupNavigationBarView() {
        
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor.red
        let view = UIView(frame: CGRect(x: 0, y: -20, width: UIScreen.main.bounds.size.width, height: 20))
        view.backgroundColor = UIColor.black
        view.alpha = 0.2
        navigationBar.addSubview(view)
    }
    
    func setStatusBarHiddenStatus(isHidden: Bool, andNavigationBarHiddenStatus isNavigationBarHidden: Bool) {
        UIApplication.shared.statusBarStyle = .default
        UIApplication.shared.isStatusBarHidden = isHidden
        setNavigationBarHiddenStatus(isHidden: isNavigationBarHidden)
    }
    
    func setNavigationBarHiddenStatus(isHidden: Bool) {
        isNavigationBarHidden = isHidden
    }
    
    // MARK: - Private methods
    fileprivate func getBarButton(withImage strImageName: String, andSelector selector:(Selector)) -> UIBarButtonItem {
        let viewBarButton = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        button.setImage(UIImage(named: strImageName), for: .normal)
        button.tintColor = UIColor.black
        button.titleLabel?.text = ""
        button.addTarget(self, action: selector, for: .touchUpInside)
        viewBarButton.addSubview(button)
        
        let barButton = UIBarButtonItem(customView: viewBarButton)
        return barButton
    }
    
    fileprivate func getSecondBarButton(withImage strImageName: String, andSelector selector:(Selector)) -> UIBarButtonItem {
        let viewBarButton = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 16, y: 0, width: 44, height: 44)
        button.setImage(UIImage(named: strImageName), for: .normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: selector, for: .touchUpInside)
        viewBarButton.addSubview(button)
        
        let barButton = UIBarButtonItem(customView: viewBarButton)
        return barButton
    }
    
    fileprivate func getThirdBarButton(withImage strImageName: String, andSelector selector:(Selector)) -> UIBarButtonItem {
        let viewBarButton = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 32, y: 0, width: 44, height: 44)
        button.setImage(UIImage(named: strImageName), for: .normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: selector, for: .touchUpInside)
        viewBarButton.addSubview(button)
        
        let barButton = UIBarButtonItem(customView: viewBarButton)
        return barButton
    }

    // MARK: - IBActions
    func clickBackButton(sender: UIButton) {
//        TANetworkManager.sharedInstance.cancelAllRequests {
//            DispatchQueue.main.async {
//                self.popViewController(animated: true)
//            }
//        }
    }
    
    func clickCustomBackButton(sender: UIButton) {
        customDelegate?.navigationBarButtonItemClicked(.back, sender: sender)
    }
    
    func clickLBButtonWithText(sender: UIButton) {
        customDelegate?.navigationBarButtonItemClicked(.back, sender: sender)
    }
    
    func clickMenuButton(sender: UIButton) {
        customDelegate?.navigationBarButtonItemClicked(.leftText, sender: sender)
    }
    
    func clickRBButtonWithText(sender: UIButton) {
        customDelegate?.navigationBarButtonItemClicked(.rightText, sender: sender)
    }
    
    func clickFirstRBButton(sender: UIButton) {
        customDelegate?.navigationBarButtonItemClicked(.rightFirst, sender: sender)
    }
    
    func clickSecondRBButton(sender: UIButton) {
        customDelegate?.navigationBarButtonItemClicked(.rightSecond, sender: sender)
    }
    
    func clickThirdRBButton(sender: UIButton) {
        customDelegate?.navigationBarButtonItemClicked(.rightThird, sender: sender)
    }
    
}
