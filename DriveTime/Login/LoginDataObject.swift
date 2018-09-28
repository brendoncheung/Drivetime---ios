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
        name        <- map["name"]
        email       <- map["email"]
        number      <- map["number"]
        city        <- map["city"]
        experience  <- map["experience"]
    }
    
    var name: String?
    var email: String?
    var number: String?
    var city: String?
    var experience: String?
}

/*
 
 JSON map
 
 Name -> name
 Email -> email
 Phone -> ?
 City -> ?
 Years ->?
 
 
*/


