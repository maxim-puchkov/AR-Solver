//
//  Recognizer.swift
//  MathVision: MathVision
//  com.maximpuchkov.MathVision.MathVision.Recognizer
//
//  Created by mpuchkov on 2019-03-26. macOS 10.13, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import TesseractOCR


protocol OpticalCharacterRecognizerProtocol {

    var language: String! { get }
    var whitelist: String! { get }
    var blacklist: String! { get }

    
    func recognizeText(_ image: UIImage!) -> String?
    func inProgress() -> Bool
    
}



/**
    OpticalCharacterRecognizer
 
    - Given an input image, recognizes specified English characters
 */
class OpticalCharacterRecognizer: NSObject, OpticalCharacterRecognizerProtocol, G8TesseractDelegate {
    
    override init() {
        self.tess = G8Tesseract(language: self.language)
        // self.tess.charWhitelist = self.whitelist
        // self.tess.charBlacklist = self.blacklist
        
        super.init()
        self.tess.delegate = self
    }
    
    /// Data model language (only English is supported)
    let language: String! = "eng"
    
    /// Allowed characters
    let whitelist: String! = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,^()"
    
    /// Prohibited characters
    let blacklist: String! = ""
    
    /// Optical character recognizer
    let tess: G8Tesseract
    
    
    /**
        Recognize characters on an image and represent
        them as a multi-lined string
     
        - Parameters:
            - image: Source image
     
        - Returns:
            - string of all recognized characters, if any;
            - nil, if recognition failed.
     */
    public func recognizeText(_ image: UIImage!) -> String? {
        self.tess.image = image
        
        if self.tess.recognize() {
            return self.tess.recognizedText
        }
        
        return nil
    }
    
    
    /**
        Check OCR progress
     
        - Returns:
            - True if recognition is in progress;
            - False otherwise.
     */
    public func inProgress() -> Bool {
        return (self.tess.progress != 100)
    }
    
}
