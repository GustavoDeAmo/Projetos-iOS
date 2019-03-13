//
//  ViewController.swift
//  Rastreador de Criptomoeda
//
//  Created by Gustavo Aryel de Amo on 11/03/2019.
//  Copyright © 2019 gamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var criptoCurrency = [""]
    var currency = [""]

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        criptoCurrency = ["BTC", "ETH", "XRP", "BCH"]
        currency = ["USD", "EUR", "JPY", "CHF"]
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return criptoCurrency.count
        }
        else {
            return currency.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return criptoCurrency[row]
        }
        else{
            return currency[row]
        }
    }
    
    //MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getPrice(criptoCurrency: criptoCurrency[picker.selectedRow(inComponent: 0)],currency:
        currency[picker.selectedRow(inComponent: 1)])
    }
    
    // MARK: - function Webservice
    func getPrice(criptoCurrency: String, currency: String){
        if let url = URL(string: "https://min-api.cryptocompare.com/data/price?fsym=" + criptoCurrency + "&tsyms=" + currency){
            URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                if let data = data {
                    print("connected")
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Double]{
                        if let jsonDictionary = json {
                        print("jsonDictionary: ", jsonDictionary)
                            DispatchQueue.main.async{
                            if let price = jsonDictionary[currency] {
                                let formatter = NumberFormatter()
                                formatter.currencyCode = currency
                                formatter.numberStyle = .currency
                                let formattedPrice = formatter.string(from: NSNumber(value: price))
                                self.resultLabel.text = formattedPrice
                            }
                        }
                    }
                }
                else{
                    print("wrong =(")
                }
            }
            }.resume()
        }
    }
}




