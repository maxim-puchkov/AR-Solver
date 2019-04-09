//
//  ViewController.swift
//  MathVision: MathVision
//  com.maximpuchkov.Untitled 1.MathVision.ViewController
//
//  Created by mpuchkov on 2019-03-26. macOS 10.13, Xcode 10.1.
//  Copyright © 2019 Maxim Puchkov. All rights reserved.
//

import UIKit

public protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage?)
}

open class ImagePicker: NSObject {
    
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?
    
    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()
        
        super.init()
        
        self.presentationController = presentationController
        self.delegate = delegate
        
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    
    public func present(from sourceView: UIView) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let action = self.action(for: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        
        self.presentationController?.present(alertController, animated: true)
    }
    
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        
        self.delegate?.didSelect(image: image)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}

extension ImagePicker: UINavigationControllerDelegate {
    
}







class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, ImagePickerDelegate {
    
    @IBOutlet weak var editInputView: UIView!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var valueTextField: UIView!
    
    @IBOutlet weak var editTextView: UITextView!
    var selectedImage: UIImage? = nil
    
    @IBOutlet weak var takeNewButton: UIButton!
    @IBOutlet weak var chooseButton: UIButton!
    
    var imagePicker: ImagePicker!
    
    @objc func addTapped() {
        print("Called")
        //let vc = ResultViewController()
        //performSegue(withIdentifier: "Result", sender: self)
    }

    
    let EmptyNavItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    let NavItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        
        navigationItem.rightBarButtonItem = self.NavItem

        
        // imagePicker.delegate = self
        
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
    
    
    
    @IBAction func confirmPressed(_ sender: Any) {
        print("Cf pressed!")
    }
    
    
    // Choose image from gallery
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    
    // Take a new image with phone camera
    @IBAction func takeNewButtonPressed(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let editViewController = segue.destination as! EditViewController
        editViewController.image = self.selectedImage
    }
    
    
    // Image selected
    func didSelect(image: UIImage?) {
        self.selectedImage = image
        self.editInputView.alpha = 1
        
        let recognizer = OpticalCharacterRecognizer()
        if let text = recognizer.recognizeText(selectedImage) {
            self.editTextView.text = text
        } else {
            self.editTextView.text = "OCR Error"
        }
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
       navigationItem.rightBarButtonItem = self.NavItem
    }
    
    
    @IBAction func confirmButtonPressed(_ sender: Any) {
        print("Pressed button")
    }
    
}

