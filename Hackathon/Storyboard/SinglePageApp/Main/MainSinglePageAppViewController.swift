//
//  MainSinglePageAppViewController.swift
//  Hackathon
//
//  Created by Zachary Slayter on 7/18/18.
//  Copyright © 2018 Credera. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import ApiAI

class MainSinglePageAppViewController: UIViewController {
    
    @IBOutlet weak var enterText: UITextField!
    @IBAction func enterAction(_ sender: Any) {
        let request = ApiAI.shared().textRequest()
        
        if let text = self.enterText.text, text != "" {
            request?.query = text
        } else {
            return
        }
        
        request?.setMappedCompletionBlockSuccess({ (request, response) in
            let response = response as! AIResponse
            if let textResponse = response.result.fulfillment.speech {
                self.speechAndText(text: textResponse)
            }
        }, failure: { (request, error) in
            print(error!)
        })
        
        ApiAI.shared().enqueue(request)
        enterText.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func speechAndText(text: String) {
        let speechSynthesizer = AVSpeechSynthesizer()
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
        
        if text == "gif_cat" {
            let giphyViewController = UIStoryboard(name: "GiphyView", bundle: nil).instantiateInitialViewController() as? GiphyViewController
            giphyViewController?.searchString = "cat"
            if giphyViewController != nil {
                navigationController?.pushViewController(giphyViewController!, animated: true)
            }
        }
        
        if text == "cam_cat" {
            let catFactVC = UIStoryboard(name: "CatFactStoryboard", bundle: nil).instantiateInitialViewController()
            if catFactVC != nil {
                navigationController?.pushViewController(catFactVC!, animated: true)
            }
        }

    }
    

    @IBAction func factClicked(_ sender: Any) {
        let catFactVC = UIStoryboard(name: "CatFactStoryboard", bundle: nil).instantiateInitialViewController()
        if catFactVC != nil {
            navigationController?.pushViewController(catFactVC!, animated: true)
        }
    }
    @IBAction func giphyClicked(_ sender: Any) {
        let giphyViewController = UIStoryboard(name: "GiphyView", bundle: nil).instantiateInitialViewController() as? GiphyViewController
        giphyViewController?.searchString = "dogs"
        if giphyViewController != nil {
            navigationController?.pushViewController(giphyViewController!, animated: true)
        }
    }
    
    @IBAction func cameraClicked(_ sender: Any) {
        //CameraHandler.shared.camera(forViewController: self)
        //CameraHandler.shared.imagePickedBlock = { (image) in
            /* get your image here */
       // }
    }
}
