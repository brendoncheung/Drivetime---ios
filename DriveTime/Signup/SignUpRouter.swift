//
//  SignUpRouter.swift
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

@objc protocol SignUpRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol SignUpDataPassing
{
  var dataStore: SignUpDataStore? { get }
}

class SignUpRouter: NSObject, SignUpRoutingLogic, SignUpDataPassing
{
  weak var viewController: SignUpViewController?
  var dataStore: SignUpDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: SignUpViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: SignUpDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
