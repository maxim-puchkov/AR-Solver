//
//  ViewController.swift
//  MathVision: MathVision
//  com.maximpuchkov.Untitled 1.MathVision.ViewController
//
//  Created by mpuchkov on 2019-03-26. macOS 10.13, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let imagePicker = UIImagePickerController()
    var selectedImage: UIImage? = nil
    
    @IBOutlet weak var takeNewButton: UIButton!
    @IBOutlet weak var chooseButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        print(solve(formula: "2x + 3", input: 5))
        
        
        /* * * OCR tests * * */
//        let recognizer = OpticalCharacterRecognizer()
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
        /* * * OCR tests * * */
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        self.selectedImage = image
    }
    
    
    
    @IBAction func chooseButtonPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func takeNewButtonPressed(_ sender: Any) {
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let editViewController = segue.destination as! EditViewController
        editViewController.image = self.selectedImage
    }
    
    

}

