//
//  JobRequestModels.swift
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
import ObjectMapper

struct JobRequest {
    
  // MARK: Use cases
  
  struct fetchJobRequest {
    
    struct Request {
        var id: String?
        var email: String?
    }
    
    struct Response {
        var jobResponses: [JobResponseDataObject]?
    }
    
    struct ViewModel {
        var id: String?
        var companyName: String?
        var description: String?
        var amountOffered: String?
        var dropOffAddress: String?
        var pickUpAddress: String?
        var loadDescription: String?
    }
  }
}

