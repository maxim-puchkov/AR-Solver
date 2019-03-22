//
//  MERecognition.swift
//  Vision: Vision
//  com.maximpuchkov.Vision.Vision.MERecognition
//
//  Created by mpuchkov on 2019-03-22. macOS 10.13, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import UIKit

import Foundation
import CoreML



class MERecognition: NSObject {
    
    
    
    let input: String
    
    let output: String
    
    let ready: Bool
    
    init(input: String) {
        self.input = input
        self.output = ""
        self.ready = true
        
        super.init();
    }
    // let data = try MLDataTable(contentsOf: URL(fileURLWithPath: ""))
    // let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)
    // let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "label")
    // Training accuracy as a percentage
    // let trainingAccuracy = (1.0 - sentimentClassifier.trainingMetrics.classificationError) * 100
    // Validation accuracy as a percentage
    // let validationAccuracy = (1.0 - sentimentClassifier.validationMetrics.classificationError) * 100
    
    
}
