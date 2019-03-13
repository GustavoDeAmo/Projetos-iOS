//
//  DetailToDoViewController.swift
//  AppListaTarefas
//
//  Created by user147974 on 07/03/19.
//  Copyright © 2019 Luxfacta. All rights reserved.
//

import UIKit

class DetailToDoViewController: UIViewController {
    //    var toDo = ToDo()
    var toDoCoreData: ToDoCoreData? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDoCoreData {
            
            if toDo.priority == 1{
                if let name = toDo.name{
                    nameLabel.text = "❗️" + name
                }
            }
            else if toDo.priority == 2{
                if let name = toDo.name {
                    nameLabel.text = "‼️" + name
                }
            }
            else{
                if let name = toDo.name {
                    nameLabel.text = name
                }
            }
        }
    }
    
    @IBAction func done(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let toDo = toDoCoreData{
                context.delete(toDo)
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        navigationController?.popViewController(animated: true)
    }
    
    
}
