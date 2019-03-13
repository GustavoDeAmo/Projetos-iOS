//
//  ToDoTableViewController.swift
//  AppListaTarefas
//
//  Created by user147974 on 07/03/19.
//  Copyright © 2019 Luxfacta. All rights reserved.
//

import UIKit
import CoreData

class ToDoTableViewController: UITableViewController {
    
    //    var toDos:[ToDo] = []
    var toDoCoreDatas:[ToDoCoreData] = []
    
    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let toDosFromCoreData = try? context.fetch(ToDoCoreData.fetchRequest()){
                if let toDos = toDosFromCoreData as? [ToDoCoreData]{
                    toDoCoreDatas = toDos
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let toDo1 = ToDoCoreData()
        //        toDo1.name = "Escreva o Capitulo 1 do livro iOS 12"
        //        toDo1.priority = 0
        //        let toDo2 = ToDoCoreData()
        //        toDo2.name = "Edite o livro iOS 12"
        //        toDo2.priority = 1
        //        toDoCoreDatas = [toDo1, toDo2]
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getToDos()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoCoreDatas.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectToDo = toDoCoreDatas[indexPath.row]
        performSegue(withIdentifier: "moveToDetails", sender: selectToDo)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cell = UITableViewCell()
        let selectedToDo = toDoCoreDatas[indexPath.row]
        
        if selectedToDo.priority == 1 {
            if let name = selectedToDo.name{
                cell.textLabel?.text = "❗️ " + name
            }
        }
        else if selectedToDo.priority == 2{
            if let name = selectedToDo.name{
                cell.textLabel?.text = "‼️ " + name
            }
        }
        else {
            if let name = selectedToDo.name {
                cell.textLabel?.text = name
            }
        }
        
        if let data = selectedToDo.image{
            cell.imageView?.image = UIImage(data: data)
        }
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    //Funçāo Delete Swipe
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                let selectedToDo = toDoCoreDatas[indexPath.row]
                context.delete(selectedToDo)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                getToDos()
            }
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let addToDoViewController = segue.destination as? AddToDoViewController{
            addToDoViewController.toDoTableViewController = self
        }
        
        if let detailsToDoViewController = segue.destination as? DetailToDoViewController{
            if let selectedToDo = sender as? ToDoCoreData {
                detailsToDoViewController.toDoCoreData = selectedToDo
            }
        }
    }
    
    
    
    
}
