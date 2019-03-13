//
//  ViewController.swift
//  OrganizadorDeImagens
//
//  Created by Gustavo Aryel de Amo on 11/03/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var resnetModel = Resnet50()
    var imagePicker = UIImagePickerController()
    

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var classification: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        if let image = imageView.image {
            classifyPicture(image: image)
        }
    }
    
    func classifyPicture(image: UIImage) {
        if let model = try? VNCoreMLModel(for: resnetModel.model){
            let request = VNCoreMLRequest(model: model) {
                (request, error) in
                if let results = request.results as? [VNClassificationObservation]{
                    let result = results[0]
                    self.classification.text = result.identifier
                }
            }
            
            if let imageData = image.jpegData(compressionQuality: 1.0){
                let handler = VNImageRequestHandler(data: imageData, options: [:])
                try? handler.perform([request])
            }
        }
    }
    


    
    // MARK: - Actions
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true,completion: nil)
    }
    
    
    @IBAction func albumTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true,completion: nil)
    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
            classifyPicture(image: image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


