//
//  UserProfileControllerViewController.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/25/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController, OnUserProfileChangeDidTouch {
    
    private let DRIVE_TIME_URL = "https://drivetimepro1.000webhostapp.com/login1.php"
    
    var viewModel: Login.FetchUserData.ViewModel?
    
    @IBOutlet weak var userProfileView: UserProfileView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        userProfileView.populateUI(viewModel: viewModel!)
        userProfileView.setDelegate(delegate: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(pushJobRequestViewController), name: Notification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userProfileView.populateUI(viewModel: viewModel!)
    }
    
    func onUserProfileChangeDidTouch() {
        let alert = UIAlertController(title: "User profile", message: "Please login to www.prodrivetime.com to change your user profile", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
    }
    
    @objc func pushJobRequestViewController() {
        tabBarController?.selectedIndex = 1
    }
}
