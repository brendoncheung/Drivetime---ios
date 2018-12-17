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

//new json response
//"id": 22,
//"request_id": "rqst5c12fc9e856ae1.06631647",
//"business_name": "Code Viable",
//"business_email": "code@viable.com",

//"title": "Apache Load/Ubuntu",
//"details": "haul my os",
//"load_description": "Operating system",
//"amount_offered": "11",

//"pickup_address": "123",
//"dropoff_address": "123",
//"timestamp": "2018-12-14 00:43:10"


//job request example json return - OLD
//
//    [
//        {
//            "id": "280",
//            "client_email": "client@example.com",
//            "client_name": "Example Client",
//            "business": "Clients Business LLC.",
//            "details": "123",
//            "amount_offered": "123",
//            "driveremail": "",
//            "timestamp": "2018-11-27 05:41:48"
//        },
//        {
//            "id": "281",
//            "client_email": "client@example.com",
//            "client_name": "Example Client",
//            "business": "Clients Business LLC.",
//            "details": "123",
//            "amount_offered": "123",
//            "driveremail": "",
//            "timestamp": "2018-12-11 01:55:24"
//        }
//]
//

