//
//  Address.swift
//  Shapes
//
//  Created by Zachary Slayter on 4/14/17.
//  Copyright © 2017 Credera. All rights reserved.
//

import Foundation
import SwiftyJSON

class Address {
    
    var street: String
    var city: String
    var state: String
    var zip: String
    
    init?(json: JSON) {
        if let streetValue = json["street"].string,
           let cityValue = json["city"].string,
           let stateValue = json["state"].string,
           let zipValue = json["postcode"].int {
            
            street = streetValue
            city = cityValue
            state = stateValue
            
            // The api passes zip code as an int. This is wrong. 
            // Zip codes can start with 0, which an integer will cut off, 
            // therefore I'm converting this int to a String and adding in 
            // potentially lost leading 0s.
            zip = String(zipValue)
            while zip.count < 5 && zip.count > 0 {
                zip = "0".appending(zip)
            }

        } else {
            return nil
        }
    }
}
