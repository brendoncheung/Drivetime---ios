//
//  UserProfile.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/18/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import UIKit

protocol OnUserProfileChangeDidTouch: class {
    func onUserProfileChangeDidTouch()
}

class UserProfileView: UIView {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userCity: UILabel!
    @IBOutlet weak var userYear: UILabel!
    
    private weak var delegate: OnUserProfileChangeDidTouch?
    
    func setDelegate(delegate: OnUserProfileChangeDidTouch) {
        self.delegate = delegate
    }
    
    private let NIB_NAME = "UserProfileView"

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initContentView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView()
    }
    
    func populateUI (viewModel: Login.FetchUserData.ViewModel) {
        self.userName.text = viewModel.name
        self.userEmail.text = viewModel.email
        self.userPhone.text = viewModel.number
        self.userCity.text = viewModel.city
        self.userYear.text = viewModel.experience
    }
    
    private func initContentView() {
        let bundle = Bundle.main
        let nib = UINib(nibName: NIB_NAME, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.clipsToBounds = true
        
        view.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        view.frame = bounds
        
        addSubview(view)
        
        addCornerRadius(radius: 10)
    }
    
    func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    @IBAction func changeUserProfileOnlineButtonDidTouch(_ sender: Any) {
        delegate?.onUserProfileChangeDidTouch()
    }
    
}
