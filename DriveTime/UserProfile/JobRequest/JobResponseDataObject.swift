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
    
    var id: String?
    var clientEmail: String?
    var clientName: String?
    var business: String?
    var detail: String?
    var amountOffered: String?
    var driverEmail: String?
    var timeStamp: String?
    
    mutating func mapping(map: Map) {
        
        id              <- map["id"]
        clientEmail     <- map["client_email"]
        clientName      <- map["client_name"]
        business        <- map["business"]
        detail          <- map["details"]
        amountOffered   <- map["amount_offered"]
        driverEmail     <- map["drivermail"]
        timeStamp       <- map["timestamp"]
        
    }
    
}
