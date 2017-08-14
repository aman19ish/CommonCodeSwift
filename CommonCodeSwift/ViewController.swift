//
//  ViewController.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 30/05/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINCExtendedDelegate {
    
    @IBOutlet weak var textImageView: UIImageViewExtension!
    let image = UIImage.init(named: "TestImage")
    
    //MARK:- View Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNaivationBar()
        let compressImage = image?.compressImage(image: image!, targetSize: CGSize.init(width: 200, height: 200), compressionQuality: 0.50)
        textImageView.image = compressImage
        
        //Get Current Location
        let location = GetCurrentLocation.sharedInstance
        location.getCurrentLocation { (currentLocation) in
            print(currentLocation ?? "")
        }
        let a = "".first
        print(a)
        print("ashdsa dsfsdfsdf".uppercaseFirstChar)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configureNaivationBar() {
        navigationController?.setStatusBarHiddenStatus(isHidden: true, andNavigationBarHiddenStatus: false)
        self.navigationController?.customDelegate = self
        navigationController?.setupNavigationBar(navItem: navigationItem, title: "Testing", leftBarButtonType: .back, rightBarItemType: .threeIcon
            , rightBarTitle: nil, arrRightBarImages: ["notifications", "notifications", "notifications"])
    }
}

//MARK:- UINCExtendedDelegate Methods
extension ViewController {
    func navigationBarButtonItemClicked(_ buttonType: NavigationBarButton, sender: UIButton) {
        
    }

}

