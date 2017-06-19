//
//  ViewController.swift
//  CommonCodeSwift
//
//  Created by Aman Gupta on 30/05/17.
//  Copyright © 2017 aman19ish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textImageView: UIImageViewExtension!
    let image = UIImage.init(named: "TestImage")
    
    //MARK:- View life cycel
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let compressImage = image?.compressImage(image: image!, targetSize: CGSize.init(width: 200, height: 200), compressionQuality: 0.50)
        textImageView.image = compressImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

