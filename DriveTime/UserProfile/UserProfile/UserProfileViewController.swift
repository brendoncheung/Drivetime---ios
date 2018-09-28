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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userProfileView.populateUI(viewModel: viewModel!)
    }
    
    func onUserProfileChangeDidTouch() {
        if let url = URL(string: DRIVE_TIME_URL) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
   

}
