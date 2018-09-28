//
//  LoadingScreenUtils.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/27/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class LoadingScreenUtils {
    
    static func startLoadingScreen(toAnimate: Bool, loadingScreen: UIView, loadingIcon: NVActivityIndicatorView) {
        switch toAnimate {
            
        case true :
            loadingIcon.startAnimating()
            
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn, animations: {
                loadingScreen.alpha = 1
                loadingIcon.alpha = 1
                }, completion: { (bool) in
            })
        case false :
            
            loadingIcon.stopAnimating()
            loadingScreen.alpha = 0
        }
    }
    
    
    
    
    
}



