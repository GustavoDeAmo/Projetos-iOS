//
//  ViewController.swift
//  clickCount
//
//  Created by Gustavo Aryel de Amo on 25/02/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     @IBOutlet weak var Label: UILabel!
//    var clickCounter = 0
      var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.text = String.init(count)
    }

    @IBAction func Button1(_ sender: Any) {
        
//        clickCounter+=1
//        Label.text = "\(clickCounter)"
        
        count = count + 1
        Label.text = String.init(count)
    }
    
    @IBAction func ButtonClear(_ sender: Any) {
//        clickCounter = 0
//        Label.text = "\(clickCounter)"
        
        count = 0
        Label.text = String.init(count)
        
    }
    
}


