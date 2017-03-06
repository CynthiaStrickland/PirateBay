//
//  PromoContentViewController.swift
//  PirateBay
//
//  Created by Cynthia Whitlatch on 2/22/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class PromoContentViewController: UIViewController {

    @IBOutlet weak var promoImageView: UIImageView!
    
    var pageIndex = 0
    var imageName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentImage = imageName {
            promoImageView.image = UIImage(named: currentImage)
        }
    }

}
