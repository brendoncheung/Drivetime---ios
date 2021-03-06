//
//  SignUpPresenter.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 8/18/18.
//  Copyright (c) 2018 Wing Sun Cheung. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SignUpPresentationLogic
{
  func presentSomething(response: SignUp.RegisterNewUser.Response)
}

class SignUpPresenter: SignUpPresentationLogic
{
  weak var viewController: SignUpDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: SignUp.RegisterNewUser.Response)
  {
    let viewModel = SignUp.RegisterNewUser.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
