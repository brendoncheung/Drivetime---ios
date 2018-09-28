//
//  LoginPresenter.swift
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

protocol LoginPresentationLogic {
    func presentFetchedResults(response: Login.FetchUserData.Response)
    func presentFailedLoginDialogue(message: String)
}

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
    
    func presentFetchedResults(response: Login.FetchUserData.Response) {
        
        guard let userProfile = response.userProfile.first else {
            return
        }
        
        // TODO: -
        // The view model should have to worry about how to convert response to viewmodel
        // It is the presenter's job, refactor this
        let viewModel = Login.FetchUserData.ViewModel(response: userProfile)
        viewController?.presentSuccessLoginDialog(viewModel: viewModel)
    }
    
    func presentFailedLoginDialogue(message: String) {
        viewController?.presentLoginErrorDialog(error: message)
    }
 
}







