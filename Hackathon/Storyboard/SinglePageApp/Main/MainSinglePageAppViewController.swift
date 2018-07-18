//
//  MainSinglePageAppViewController.swift
//  Hackathon
//
//  Created by Zachary Slayter on 7/18/18.
//  Copyright © 2018 Credera. All rights reserved.
//

import Foundation
import UIKit

class MainSinglePageAppViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func factClicked(_ sender: Any) {
        let catFactVC = UIStoryboard(name: "CatFactVC", bundle: nil).instantiateInitialViewController()
        if catFactVC != nil {
            navigationController?.pushViewController(catFactVC!, animated: true)
        }
    }
    @IBAction func giphyClicked(_ sender: Any) {
        let giphyViewController = UIStoryboard(name: "GiphyView", bundle: nil).instantiateInitialViewController()
        if giphyViewController != nil {
            navigationController?.pushViewController(giphyViewController!, animated: true)
        }
    }
    
    @IBAction func cameraClicked(_ sender: Any) {
        CameraHandler.shared.camera(forViewController: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            /* get your image here */
        }
    }
}
