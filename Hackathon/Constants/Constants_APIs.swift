//
//  Constants_APIs.swift
//  Shapes
//
//  Created by Zachary Slayter on 4/14/17.
//  Copyright © 2017 Credera. All rights reserved.
//

import Foundation
import Alamofire


extension Constants {
    
    struct APIs {
        
        struct RandomUser {
            static let HOST = "https://randomuser.me"
            
            struct Endpoints {
                struct GetRandomUser {
                    static let PATH = "/api/"
                    static let METHOD = HTTPMethod.get
                    
                    static func getParameters() -> Parameters? {
                        return nil
                    }
                    
                }
            }
        }
        
    }


    
}
