//
//  LoginDataObject.swift
//  DriveTime
//
//  Created by Wing Sun Cheung on 8/1/18.
//  Copyright © 2018 Wing Sun Cheung. All rights reserved.
//

import Foundation
import ObjectMapper

struct LoginDataObject : Mappable
{
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        
        driverID    <- map["driver_id"]
        name        <- map["name"]
        email       <- map["email"]
        number      <- map["phone"]
        city        <- map["city"]
        state       <- map["state"]
        experience  <- map["experience"]
    }
    
    var driverID: String?
    var name: String?
    var email: String?
    var number: String?
    var city: String?
    var state: String?
    var experience: String?
}


