//
//  MainTabBarController.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/25/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import Foundation
import UIKit

import Alamofire
import ObjectMapper

struct JobResponsePayload: Mappable {
    
    init?(map: Map) {
        
    }
    
    var jobRequest: [JobResponseDataObject]?
    
    mutating func mapping(map: Map) {
        jobRequest      <- map["0.value"]
    }
}

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        testingParse()
    }
    
    func getUserProfileViewController() -> UIViewController? {
        return self.viewControllers?[0]
    }
    
    func getJobRequestViewController() -> UIViewController? {
        return self.viewControllers?[1]
    }
    
    
    func testingParse() {
        
        Alamofire.request("https://www.prodrivetime.com/api/driverApi/driverRequestLoad.php", method: .post, parameters: ["driverEmail":"brendon.cheung@Outlook.com"], encoding: URLEncoding(), headers: nil).responseJSON { (json) in

            let data = json.data?.description.data(using: .utf8)
            log.debug(data)
//            switch json.result {
//
//            case .success(let data):
//                let jobs = data as! NSArray
//
//                log.debug(type(of:jobs.description)) // String
//                log.debug(jobs.description) // the whole json
//
//                let job = JobResponsePayload(JSONString: jobs.description)
//                log.debug(job)
//                print(jobs[0]) // returns the first job
//                log.debug(type(of: jobs[0])) // NSStringObjectArray
//                //log.debug(data)
//                log.debug(type(of: data)) // NSArray
//
//                guard let jobrequest = data as? [NSArray: NSArray] else {
//                    return
//                }
//
//                log.debug(jobrequest)
//
//            case .failure(let error):
//
//                log.debug(error)
//
//            }
        }

        
    }
}

extension MainTabBarController: onLoginSuccessfulDelegate {
    
    func onUserProfileDataReady(viewModel: Login.FetchUserData.ViewModel?, email: String?, password: String?) {
        
        if let name = viewModel?.name {
            self.title = "Hello \(name)"
        } else {
        
            self.title = "Hello"
        }
        
        if let userVC = getUserProfileViewController() as? UserProfileViewController {
            userVC.viewModel = viewModel
            log.debug("Successfully displayed user profile")
        }
        
        if let jobRequestVC = getJobRequestViewController() as? JobRequestViewController {
            jobRequestVC.email = email
        }
    }
    
    @objc func handleSignOut() {
        
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginScreen")
        UserDefaults.standard.setLoggedIn(value: false)
        navigationController?.pushViewController(loginVC, animated: true)
    }
}


