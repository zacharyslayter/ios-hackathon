//
//  GiphyViewController.swift
//  Hackathon
//
//  Created by Zachary Slayter on 7/18/18.
//  Copyright © 2018 Credera. All rights reserved.
//

import Foundation
import UIKit
import GiphyCoreSDK
import WebKit

class GiphyViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    var searchString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Giphy API Key
        GiphyCore.configure(apiKey: "2AM8JKG7GT8hdSZpqUW9segu7eb62lzV")
        // Gif Search
        let op = GiphyCore.shared.search(self.searchString) { (response, error) in
            
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            // Retrieve just the first value
            let response = response
            let data = response!.data
            let size = data!.count
            let randomInt =  Int(arc4random()) % size
            let gifURL = "https://media.giphy.com/media/" + data![randomInt].id + "/giphy.gif"
            print(gifURL)
            let imageURL = UIImage.gifImageWithURL(gifUrl: gifURL)
            DispatchQueue.main.async {
                self.gifImageView.image = imageURL
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func felineLucky() {
        let op = GiphyCore.shared.search("cats") { (response, error) in
            
            if let error = error as NSError? {
                // Do what you want with the error
            }
            
            // Retrieve just the first value
            let response = response
            let data = response!.data
            let size = data!.count
            let randomInt =  Int(arc4random()) % size
            let gifURL = "https://media.giphy.com/media/" + data![randomInt].id + "/giphy.gif"
            print(gifURL)
            let imageURL = UIImage.gifImageWithURL(gifUrl: gifURL)
            DispatchQueue.main.async {
                self.gifImageView.image = imageURL
            }
        }
    }
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
