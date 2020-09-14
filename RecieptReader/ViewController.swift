//
//  ViewController.swift
//  RecieptReader
//
//  Created by Chetan Melkote nagaraj on 12/4/20.
//  Copyright © 2020 Chetan M Nagaraj. All rights reserved.
//

import UIKit
import FirebaseMLVision

class ViewController: UIViewController {

    var textRecognizer: VisionTextRecognizer!
    
    let feedBackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    var textRecognized = [""]
    
    @IBOutlet weak var displayPickedImage: UIImageView!
    @IBOutlet weak var recognizeText: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var pickImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        pickImage.layer.cornerRadius = 20
        recognizeText.layer.cornerRadius = 20
        let vision = Vision.vision()
        textRecognizer = vision.onDeviceTextRecognizer()
       
    }

    @IBAction func onClickPickImage(_ sender: Any) {

        //imagePicker.sourceType = .photoLibrary
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func onClickTextRecognizer(_ sender: UIButton) {
        
        if displayPickedImage.image != nil {
            runTextRecognition(with: displayPickedImage.image!)
        } else {
            let alert = UIAlertController(title: "Text Detection", message: "Please select an image for text dectection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true)
    }
        
    }
    
    func runTextRecognition(with image: UIImage) {
        let visionImage = VisionImage(image: image)
        textRecognizer.process(visionImage) { (features, error) in
            self.processResult(from: features, error: error)
        }
    }
    
    func processResult(from text: VisionText?, error: Error?) {
        
        guard let features = text, let image = displayPickedImage.image else { return }

        textRecognized.append(features.text)

        performSegue(withIdentifier: "Show text", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show text" {
            if let navVC = segue.destination as? UINavigationController {
                if let VC = navVC.topViewController as? TextRecognizedViewController {
                VC.textRecognize = textRecognized
                textRecognized = [""]
            }
            
            }
        }
    }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            displayPickedImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
