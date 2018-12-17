//
//  MainNavigationControllerViewController.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 10/26/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import UIKit

class MainNavigationControllerViewController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if UserDefaults.standard.isLoggedIn() {
            
            self.delegate = self
            
            let saveEmail = UserDefaults.standard.string(forKey: "id")
            let savePassword = UserDefaults.standard.string(forKey: "password")
            
            let worker = LoginWorker()
            let request = Login.FetchUserData.Request(email: saveEmail, password: savePassword)
            
            worker.fetchUserData(payload: request) { (response, error) in
                
                guard let response = response?.userProfile else {
                    return
                }
                
                let vm = Login.FetchUserData.ViewModel(response: response)
                
                let mainTabBarViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarViewController") as! MainTabBarController
                
                mainTabBarViewController.onUserProfileDataReady(viewModel: vm, email: saveEmail, password: savePassword)
                
                mainTabBarViewController.selectedIndex = 1
                
                self.pushViewController(mainTabBarViewController, animated: true)

            }
            
        } else {
            
            // TODO: - push login view controller to navigation stack
            
        }
        
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        viewController.view.resignFirstResponder()
    }
    
}















