//
//  ViewController.swift
//  IMC
//
//  Created by Gustavo Aryel de Amo on 26/02/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var imcLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func calculateIMC(_ sender: Any) {
        let weight = Double(weightTextField.text!)!
        let height = Double(heightTextField.text!)!
        
        let imc = weight/(height*height)

        var classification: String
        if imc < 18.5 {
            classification = "Abaixo do peso"
        }
        else if imc < 24.9{
            classification = "Normal"
        }
        else if imc < 29.9 {
            classification = "Acima do peso"
        }else{
            classification = "Obeso"
        }
        
        
        let imcFormatted = String(format: "%.1f",imc)
        
        imcLabel.text = "IMC: \(imcFormatted), \(classification)"
        
    }
    
}


