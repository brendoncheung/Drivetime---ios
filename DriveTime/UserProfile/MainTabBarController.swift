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
    
    override func viewDidLoad() {
        let leftButton = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(handleSignOut))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
    func getUserProfileViewController() -> UIViewController? {
        return self.viewControllers?[0]
    }
    
    func getJobRequestViewController() -> UIViewController? {
        return self.viewControllers?[1]
    }
    
}

extension MainTabBarController: onLoginSuccessfulDelegate {
    
    func onUserProfileDataReady(viewModel: Login.FetchUserData.ViewModel?, email: String?, password: String?) {
        
        if let name = viewModel?.name {
            self.title = "Hello \(name)"
        } else {
        
            self.title = "Hello"
        }
        
        if let userVC = getUserProfileViewController() as? UserProfileViewController {
            userVC.viewModel = viewModel
            log.debug("Successfully displayed user profile")
        }
        
        if let jobRequestVC = getJobRequestViewController() as? JobRequestViewController {
            jobRequestVC.email = email
        }
    }
    
    @objc func handleSignOut() {
        
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginScreen")
        UserDefaults.standard.setLoggedIn(value: false)
        navigationController?.pushViewController(loginVC, animated: true)
    }
}


