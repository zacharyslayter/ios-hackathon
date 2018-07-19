//
//  CatFactDialogVC.swift
//  Hackathon
//
//  Created by Melanie Cummings on 7/18/18.
//  Copyright © 2018 Credera. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import ApiAI

class CatFactDialogVC: UIViewController {

    @IBOutlet weak var catFactResponse: UILabel!
    @IBOutlet weak var catQuestion: UITextField!
    
    @IBAction func askQuestion(_ sender: Any) {
        let request = ApiAI.shared().textRequest()
        
        if let text = self.catQuestion.text, text != "" {
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
        catQuestion.text = ""
    }
    
    func speechAndText(text: String) {
        let speechSynthesizer = AVSpeechSynthesizer()
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.catFactResponse.text = text
            self.catFactResponse.textColor = .random()
        }, completion: nil)
    
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
