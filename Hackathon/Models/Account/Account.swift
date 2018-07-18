//
//  Account.swift
//  Shapes
//
//  Created by Zachary Slayter on 4/14/17.
//  Copyright © 2017 Credera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Account {

    private let dateFormatter = DateFormatter(format: "yyyy-MM-dd hh:mm:ss")
    
    var firstName: String
    var lastName: String
    
    var address: Address
    
    var email: String
    var phone: String
    
    var dob: Date
    
    var imgURL: URL
    
    
    init?(json: JSON) {
        if let firstNameValue = json["name"]["first"].string,
            let lastNameValue = json["name"]["last"].string,
            let addressValue = Address(json: json["location"]),
            let emailValue = json["email"].string,
            let phoneValue = json["phone"].string,
            let dobValue = json["dob"].string,
            let imgURLValue = json["picture"]["large"].string {
            
            firstName = firstNameValue
            lastName = lastNameValue
            
            address = addressValue
            
            email = emailValue
            phone = phoneValue
            
            if let date = dateFormatter.date(from: dobValue) {
                dob = date
            } else {
                return nil
            }
            
            imgURL = URL(fileURLWithPath: imgURLValue)
            
        } else {
            return nil
        }
    }
    
}
