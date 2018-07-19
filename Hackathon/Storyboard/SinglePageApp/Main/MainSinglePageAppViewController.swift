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
import Vision
import CoreML

class MainSinglePageAppViewController: UIViewController {
    
    @IBOutlet weak var whatIsThisResult: UILabel!
    
    @IBOutlet weak var enterText: UITextField!
    @IBAction func enterAction(_ sender: Any) {
        let giphyViewController = UIStoryboard(name: "GiphyView", bundle: nil).instantiateInitialViewController() as? GiphyViewController
        giphyViewController?.searchString = enterText.text!
        if giphyViewController != nil {
            navigationController?.pushViewController(giphyViewController!, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        CameraHandler.shared.camera(forViewController: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            let model = Resnet50()
            let buffer = self.getCVPixelBuffer(image.cgImage!)
            
            guard let prediction: Resnet50Output = try? model.prediction(image: buffer!) else {
                fatalError("something something")
            }
            
            var resultLabel = ""
            if (prediction.classLabel.contains("Cat") || prediction.classLabel.contains("cat")) {
                resultLabel = "THIS IS A CAT"
            } else {
                resultLabel = "THIS IS NOT A CAT THIS IS A " + prediction.classLabel;
            }
            
            self.whatIsThisResult.text = resultLabel;
        }
    }
    
    func getCVPixelBuffer(_ image: CGImage) -> CVPixelBuffer? {
        let imageWidth = 224
        let imageHeight = 224
        
        let attributes : [NSObject:AnyObject] = [
            kCVPixelBufferCGImageCompatibilityKey : true as AnyObject,
            kCVPixelBufferCGBitmapContextCompatibilityKey : true as AnyObject
        ]
        
        var pxbuffer: CVPixelBuffer? = nil
        CVPixelBufferCreate(kCFAllocatorDefault,
                            imageWidth,
                            imageHeight,
                            kCVPixelFormatType_32ARGB,
                            attributes as CFDictionary?,
                            &pxbuffer)
        
        if let _pxbuffer = pxbuffer {
            let flags = CVPixelBufferLockFlags(rawValue: 0)
            CVPixelBufferLockBaseAddress(_pxbuffer, flags)
            let pxdata = CVPixelBufferGetBaseAddress(_pxbuffer)
            
            let rgbColorSpace = CGColorSpaceCreateDeviceRGB();
            let context = CGContext(data: pxdata,
                                    width: imageWidth,
                                    height: imageHeight,
                                    bitsPerComponent: 8,
                                    bytesPerRow: CVPixelBufferGetBytesPerRow(_pxbuffer),
                                    space: rgbColorSpace,
                                    bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)
            
            if let _context = context {
                _context.draw(image, in: CGRect.init(x: 0, y: 0, width: imageWidth, height: imageHeight))
            }
            else {
                CVPixelBufferUnlockBaseAddress(_pxbuffer, flags);
                return nil
            }
            
            CVPixelBufferUnlockBaseAddress(_pxbuffer, flags);
            return _pxbuffer;
        }
        
        return nil
    }
}
