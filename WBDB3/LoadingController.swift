//
//  LoadingController.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/4/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

class LoadingController: UIViewController {
    @IBOutlet var logoView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidAppear(_: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut, .autoreverse, .repeat], animations: {
            UIView.setAnimationRepeatCount(2.5)
            self.logoView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { (_: Bool) in
            self.performSegue(withIdentifier: "fromLoadingToCalendarSegue", sender: self)
        })
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var shouldAutorotate: Bool {
        return true
    }
}
