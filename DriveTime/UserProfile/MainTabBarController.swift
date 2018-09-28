//
//  MainTabBarController.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/25/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    func getUserProfileViewController() -> UIViewController? {
        return self.viewControllers?[0]
    }
    
    func getJobRequestViewController() -> UIViewController? {
        return self.viewControllers?[1]
    }
}

extension MainTabBarController: onLoginSuccessfulDelegate {
    func onUserProfileDataReady(viewModel: Login.FetchUserData.ViewModel?, email: String?, password: String?) {
        
        if let userVC = getUserProfileViewController() as? UserProfileViewController {
            userVC.viewModel = viewModel
            log.debug("Successfully displayed user profile")
        }
        
        if let jobRequestVC = getJobRequestViewController() as? JobRequestViewController {
            jobRequestVC.email = email
        }
    }
    
    

}


