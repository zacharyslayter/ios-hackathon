//
//  UIImageView.swift
//  Shapes
//
//  Created by Zachary Slayter on 4/20/17.
//  Copyright © 2017 Credera. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func setTint(color: UIColor) {
        if self.image == nil {
            return
        }
        
        self.tintColor = color
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
    }
    
}
