//
//  ViewController.swift
//  MathVision: MathVision
//  com.maximpuchkov.Untitled 1.MathVision.ViewController
//
//  Created by mpuchkov on 2019-03-26. macOS 10.13, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import UIKit
import TesseractOCR

class ViewController: UIViewController, G8TesseractDelegate {
    
    
    let tess: G8Tesseract = G8Tesseract(language: "eng")
    let image = UIImage(named: "Text1")
    let alphanum = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Test OCR
        print("Testing optical character recognition...")
        
        tess.delegate = self
        
        tess.charWhitelist = alphanum
        
        tess.image = image
        
        tess.recognize()
        
        let imageText = tess.recognizedText!
        
        print("Output: \(imageText)")
        // Test ends
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

