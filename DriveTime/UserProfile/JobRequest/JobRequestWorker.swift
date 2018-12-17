//
//  JobRequestWorker.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/18/18.
//  Copyright (c) 2018 Wing Sun Cheung. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Alamofire
import AlamofireObjectMapper

enum JobRequestError: Error {
    case FailedToFetchEmptyJobRequests
}

class JobRequestWorker {
    
    // This is the api address for fetch the available jobs
    private let JOB_REQUEST_BASE_URL = "https://www.prodrivetime.com/api/driverApi/driverRequestLoad.php"
    
    private let ACCEPT_JOB_REQUEST_BASE_URL = "https://drivetimepro1.000webhostapp.com/apps/android/acceptRequests.php?"
    
    func fetchJobRequests(email: String?, completionHandler: @escaping (JobRequest.fetchJobRequest.Response?, JobRequestError?) -> Void) {
        
        guard let email = email else {
            return
        }
        
        // This id number only pulls 0 - 1000 job requests, if we need more, we need to iterate at 1000 steps 
        
        let id = 0
        
        let parameter = [
            "driverEmail" : email
        ]
        
        Alamofire.request(JOB_REQUEST_BASE_URL, method: .post, parameters: parameter, encoding: URLEncoding(), headers: nil).responseArray { (response: DataResponse<[JobResponseDataObject]>) in
            
            log.debug("Fetching Job Requests...")
            
            switch response.result {
                
            case .success(let responseArray) :
                log.debug(response.debugDescription)
                log.debug("Sucessfully fetch job requests")
                log.debug("Job request counts: \(responseArray.count)")
                completionHandler(JobRequest.fetchJobRequest.Response(jobResponses: responseArray), nil)
                
            case .failure(let error) :
                
                log.debug("Fetching error: JobRequest")
                log.debug(error.localizedDescription)
                completionHandler(nil, .FailedToFetchEmptyJobRequests)
                
            }
        }
    }
    
    func acceptJobRequest(jobRequestObject: JobResponseDataObject?, email: String?, onCompletionHandler: @escaping (Bool) -> ()) {
        
        guard let jobRequestObject = jobRequestObject else {
            return
        }
        
        log.debug("Worker accepting job request")
        
        // MARK: - This needs to be mapped to unoptional dictionary
        
        let parameters: [String : String] = [
            
            "id"                : jobRequestObject.id!.toString(),
            "client_email"      : jobRequestObject.businessEmail!,
            "client_name"       : jobRequestObject.businessName!,
            "business"          : jobRequestObject.businessName!,
            "details"           : jobRequestObject.details!,
            "amount_offered"    : jobRequestObject.amountOffered!,
            "driver_email"      : email!
        ]
        
        Alamofire.request(ACCEPT_JOB_REQUEST_BASE_URL, method: .get, parameters: parameters, encoding: URLEncoding(), headers: nil).responseString { (response) in
            
            if (response.description.range(of: "SUCCESS") != nil) {
                onCompletionHandler(true)
                log.debug("Job successfully accepted")
            }
        }
    }
}

extension Int {
    func toString() -> String {
        return ("\(self)")
    }
}




