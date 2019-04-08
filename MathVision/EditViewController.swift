//
//  EditViewController.swift
//  MathVision: MathVision
//  com.maximpuchkov.MathVision.MathVision.EditViewController
//
//  Created by mpuchkov on 2019-04-07. macOS 10.13, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import UIKit

class EditViewController: ViewController {
    
    var image: UIImage? = nil
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var solveButton: UIButton!
    @IBOutlet weak var valueTextField: UITextField!
    
    let OCRError = "Text recognition error"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let recognizer = OpticalCharacterRecognizer()
        
        if let selectedImage = self.image, let text = recognizer.recognizeText(selectedImage) {
            self.textView.text = text
        } else {
            self.textView.text = self.OCRError
        }
        
        
//        for i in 1...10 {
//            let image = UIImage(named: "Test\(i)")
//
//            print("Output \(i):\n")
//            if let text = recognizer.recognizeText(image) {
//                print("\"\(text)\"")
//            } else {
//                print("< OCR Failed >")
//            }
//        }
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.text = self.textView.text
    }
    
    
    
    @IBAction func solveButtonPressed(_ sender: Any) {
        
    }
    
}
