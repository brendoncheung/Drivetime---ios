//
//  UserDefaultHelper.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 10/25/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import Foundation
import Alamofire
extension UserDefaults {
    
    func setLoggedIn(value: Bool) {
        UserDefaults.standard.set(value, forKey: "isLoggedIn")
        
        if value == false {
            // This is to destroy the cookie and the session
            Alamofire.request("https://www.prodrivetime.com/controls/logout.php")
        }
        synchronize()
        log.debug("\(UserDefaults.standard.bool(forKey: "isLoggedIn"))")
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: "isLoggedIn")
    }
    
    func saveUserLogin(id: String, password: String) {
        UserDefaults.standard.set(id, forKey: "id")
        UserDefaults.standard.set(password, forKey: "password")
        synchronize()
    }
    
}


