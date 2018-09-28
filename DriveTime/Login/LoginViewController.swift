//
//  LoginViewController.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 8/1/18.
//  Copyright (c) 2018 Wing Sun Cheung. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import NVActivityIndicatorView

protocol LoginDisplayLogic: class {
    
    func presentLoginErrorDialog(error: String)
    func presentSuccessLoginDialog(viewModel: Login.FetchUserData.ViewModel)
}

protocol onLoginSuccessfulDelegate: class {
    func onUserProfileDataReady(viewModel: Login.FetchUserData.ViewModel?, email: String?, password: String?)
}


class LoginViewController: UIViewController, LoginDelegate {
    
    private let REGISTER_USER_BASE_URL = "https://drivetimepro1.000webhostapp.com/driverRegister.php"
    
    var viewModelForUserProfile: Login.FetchUserData.ViewModel?
    private var email: String?
    private var password: String?
    
    weak var userProfileDelegate: onLoginSuccessfulDelegate?
    
    @IBOutlet weak var blurLoadingScreen: UIVisualEffectView!
    @IBOutlet weak var loginView: LoginView!
    @IBOutlet weak var loadingIcon: NVActivityIndicatorView!
    
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    func login(username: String?, password: String?) {
        
        //startLoadingScreen(toAnimate: true, loadingScreen: blurLoadingScreen)
        LoadingScreenUtils.startLoadingScreen(toAnimate: true, loadingScreen: blurLoadingScreen, loadingIcon: loadingIcon)
        
        let loginCredential = Login.FetchUserData.Request(email: username, password: password)
        interactor?.fetchLoginData(request: loginCredential)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.setDelegate(delegate: self)
        setup()
        uisetup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        viewController.interactor = interactor
        viewController.router = router
        router.dataStore = interactor
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    @IBAction func onRegisterButtonDidTouch(_ sender: Any) {
        if let url = URL(string: REGISTER_USER_BASE_URL) {
            UIApplication.shared.open(url, options: [:])
            
        }
    }
    
    func uisetup() {
        let backgroundImageView = UIImageView(image: UIImage(named: "homebg"))
        backgroundImageView.frame = view.frame
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.sendSubview(toBack: backgroundImageView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? onLoginSuccessfulDelegate {
            
            userProfileDelegate = destinationVC
            userProfileDelegate?.onUserProfileDataReady(viewModel: viewModelForUserProfile, email: email, password: password)
        }
    }
}

// Controlling UIKeyboard behaviour implementation

extension LoginViewController: UITextFieldDelegate {
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// Presenter protocol implementation

extension LoginViewController: LoginDisplayLogic {
    
    func presentLoginErrorDialog(error: String) {
        
        let alertController = UIAlertController(title: "Login", message:  error, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        LoadingScreenUtils.startLoadingScreen(toAnimate: false, loadingScreen: blurLoadingScreen, loadingIcon: loadingIcon)
    }
    
    func presentSuccessLoginDialog(viewModel: Login.FetchUserData.ViewModel) {
        
        log.debug("presentSuccessLoginDialog")
        viewModelForUserProfile = viewModel
        
        LoadingScreenUtils.startLoadingScreen(toAnimate: false, loadingScreen: blurLoadingScreen, loadingIcon: loadingIcon)
        
        password = loginView.getPassword()
        email = loginView.getUserName()
        
        performSegue(withIdentifier: "userProfile", sender: nil)
    }
}






