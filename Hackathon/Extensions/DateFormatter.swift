//
//  DateFormatter.swift
//  Shapes
//
//  Created by Zachary Slayter on 4/14/17.
//  Copyright © 2017 Credera. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    convenience init(format: String) {
        self.init()
        
        self.dateFormat = format
    }
}
