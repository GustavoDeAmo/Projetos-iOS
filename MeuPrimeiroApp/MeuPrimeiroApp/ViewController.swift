//
//  ViewController.swift
//  MeuPrimeiroApp
//
//  Created by Gustavo Aryel de Amo on 25/02/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text = "Olá a todos!"
        

    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        print("button Tapped")
        
    }
    
}




