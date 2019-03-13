//
//  QuoteDetailViewController.swift
//  AppCitacoes
//
//  Created by Gustavo Aryel de Amo on 27/02/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import UIKit

class QuoteDetailViewController: UIViewController {

    @IBOutlet weak var quoteLabel: UILabel!
    
    var quote = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteLabel.text = quote
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
