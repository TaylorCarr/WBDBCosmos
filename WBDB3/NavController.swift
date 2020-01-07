//
//  NavController.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/2/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

class NavController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let capLogo = UIImageView(image: UIImage(named: "capgeminiSpade"))
        capLogo.frame = CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: CGFloat(500), height: CGFloat(500))
        capLogo.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        capLogo.alpha = 0.2

        self.view.insertSubview(capLogo, at: 0)
        self.view.backgroundColor = UIColor.white
        
//        let headerText = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 15))
//        headerText.text = "WARNER BROS."
//        headerText.font = UIFont(name: "GillSans-Bold", size: CGFloat(25))
//        headerText.textColor = UIColor(named: "wbblue")!
//        navigationItem.titleView = headerText
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {

        return .portrait
       
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
}
