//
//  JobRequestDataObject.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 9/26/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import Foundation
import ObjectMapper

struct JobResponseDataObject: Mappable {
    
    init?(map: Map) {
        
    }
    
    var id: Int?
    var requestId: String?
    var businessName: String?
    var businessEmail: String?
    
    var title: String?
    var details: String?
    var loadDescription: String?
    var amountOffered: String?
    
    var pickUpAddress: String?
    var dropOffAddress: String?
    var timestamp: String?
    
    mutating func mapping(map: Map) {
        
        id              <- map["id"]
        requestId       <- map["request_id"]
        businessName    <- map["business_name"]
        businessEmail   <- map["business_email"]
        
        title           <- map["title"]
        details         <- map["details"]
        loadDescription <- map["load_description"]
        amountOffered   <- map["amount_offered"]
        
        pickUpAddress   <- map["pickup_address"]
        dropOffAddress  <- map["dropoff_address"]
        timestamp       <- map["timestamp"]
    }
}






