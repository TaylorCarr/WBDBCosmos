//
//  AdaptiveFilterView.swift
//  WBDB3
//
//  Created by Taylor Carr on 12/6/19.
//  Copyright © 2019 Taylor Carr. All rights reserved.
//

import Foundation
import UIKit

class AdaptiveFilterView: UIViewController {
    @IBOutlet weak var filterSelectionsContainer: UIView!
    
    
    override func viewDidLoad() {
        var safeArea = UIEdgeInsets()
        // Get the superview's layout
        let margins = view.layoutMarginsGuide
        
        if (UIDevice.current.orientation.isLandscape) {
            var constraintsArrayLandscape: [NSLayoutConstraint] = [
//                filterSelectionsContainer.topAnchor.constraint(equalToSystemSpacingBelow: <#T##NSLayoutYAxisAnchor#>, multiplier: <#T##CGFloat#>)
//                (equalTo: margins.topAnchor + 20).isActive = true
////                    safeArea.top + 20
////
//
            ]
            
           // filterSelectionsContainer.addConstraints(<#T##constraints: [NSLayoutConstraint]##[NSLayoutConstraint]#>)
        }
        else {
            
        }
    }
}
