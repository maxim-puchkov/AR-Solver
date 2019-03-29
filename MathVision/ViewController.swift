//
//  ViewController.swift
//  MathVision: MathVision
//  com.maximpuchkov.Untitled 1.MathVision.ViewController
//
//  Created by mpuchkov on 2019-03-26. macOS 10.13, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(solve(formula: "2x + 3", input: 5))
        /* * * OCR tests * * */
        let recognizer = OpticalCharacterRecognizer()
        for i in 1...10 {
            let image = UIImage(named: "Test\(i)")
            
            print("Output \(i):\n")
            if let text = recognizer.recognizeText(image) {
                print("\"\(text)\"")
            } else {
                print("< OCR Failed >")
            }
        }
        /* * * OCR tests * * */
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

