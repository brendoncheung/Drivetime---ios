//
//  LoginWorker.swift
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
import Alamofire
import AlamofireObjectMapper
import KeychainSwift

enum LoginError: Error {
    
    case incompleteField
    case incorrectUsernameOrPassword
    case noNetworkConnection
}

class LoginWorker {
    
    private let BASE_URL = "https://www.prodrivetime.com/api/mobileApi/mobileDriverLogin"
    private let USERNAME_API_PARAM = "email"
    private let PASSWORD_API_PARAM = "password"
    
    private let KEYCHAIN_USERNAME_KEY = "username"
    private let KEYCHAIN_PASSWORD_KEY = "password"
    private let KEYCHAIN_LOGIN_STATUS_KEY = "isLoggedIn"
    
    func fetchUserData(payload: Login.FetchUserData.Request, completionHandler: @escaping (Login.FetchUserData.Response?, LoginError?) -> Void) {
        
        let reachablity = NetworkReachabilityManager();
        
        guard let isConnected = reachablity?.isReachable, isConnected != false else {
            completionHandler(nil, .noNetworkConnection)
            return
        }
        
        guard let email = payload.email, !email.isEmpty, let password = payload.password, !password.isEmpty else {
            completionHandler(nil, .incompleteField)
            return
        }
        
        let parameter: [String: String] = [USERNAME_API_PARAM: email, PASSWORD_API_PARAM: password]
        log.debug(parameter)
        
        Alamofire.request(BASE_URL, method: .post, parameters: parameter, encoding: URLEncoding(), headers: nil).responseObject { [unowned self] (response: DataResponse<LoginDataObject>) in
            log.debug(response)

            switch response.result {
                
            case .success(let response):
                log.debug("Login success")
                completionHandler(Login.FetchUserData.Response(userProfile: response), nil)
                
                // save credentials to keychain upon a login success
                KeychainSwift().set(email, forKey: self.KEYCHAIN_USERNAME_KEY)
                KeychainSwift().set(password, forKey: self.KEYCHAIN_PASSWORD_KEY)
                KeychainSwift().set(true, forKey: self.KEYCHAIN_LOGIN_STATUS_KEY)
                
            case .failure(let error) :
                
                log.debug("Login error: \(error.localizedDescription)")
                completionHandler(nil, .incorrectUsernameOrPassword)
                
                
            }
        }
        
    }
}




















