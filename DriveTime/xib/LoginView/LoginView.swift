//
//  LoginView.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/18/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginView: UIView {
    
    @IBOutlet weak var username: HoshiTextField!
    @IBOutlet weak var password: HoshiTextField!
    
    weak var loginDelegate: LoginDelegate?
    
    func getPassword() -> String? {
        return password.text
    }
    
    func getUserName() -> String? {
        return username.text
    }
    
    func setDelegate(delegate: LoginDelegate) {
        self.loginDelegate = delegate
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        loginDelegate?.login(username: getUserName(), password: getPassword())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initContentView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initContentView()
    }
    
    func initContentView() {
        let bundle = Bundle.main
        let nib = UINib(nibName: "LoginView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        view.autoresizingMask = [
            .flexibleWidth,
            .flexibleHeight
        ]
        view.frame = bounds
        addSubview(view)
    }
}

@objc protocol LoginDelegate {
    func login(username: String?, password: String?)
}




































