//
//  UserProfileControllerViewController.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/25/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    var viewModel: Login.FetchUserData.ViewModel?
    @IBOutlet weak var userProfileView: UserProfileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileView.populateUI(viewModel: viewModel!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userProfileView.populateUI(viewModel: viewModel!)
    }
    
   

}
