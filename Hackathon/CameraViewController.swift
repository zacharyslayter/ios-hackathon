//
//  CameraViewController.swift
//  Hackathon
//
//  Created by Zachary Slayter on 7/18/18.
//  Copyright © 2018 Credera. All rights reserved.
//

import Foundation
import UIKit

class CameraViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        CameraHandler.shared.camera()
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            /* get your image here */
        }
    }
    
}
