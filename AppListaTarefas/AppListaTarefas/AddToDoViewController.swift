//
//  AddToDoViewController.swift
//  AppListaTarefas
//
//  Created by user147974 on 07/03/19.
//  Copyright © 2019 Luxfacta. All rights reserved.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var pickerController = UIImagePickerController()
    var toDoTableViewController:ToDoTableViewController? = nil
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var newToDo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage{
            imageView.image = image
            
        }
        pickerController.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
    
    @IBAction func save(_ sender: Any) {
        if validateText(text: nameTextField.text){
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
            {
                let newToDo = ToDoCoreData(context: context)
                newToDo.priority = Int32(prioritySegmentedControl.selectedSegmentIndex)
                newToDo.name = nameTextField.text!
                newToDo.image = imageView.image?.jpegData(compressionQuality: 1.0)
                
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                
                dismiss(animated: true, completion: nil)
            }
        }
        else {
            let alert = UIAlertController(title: "Oops!", message: "O campo nome deve ser preenchido!",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            present(alert,animated: true)
        }
    }
    
    func validateText(text: String?) -> Bool {
        if text != nil && text!.isEmpty
        {
            return false
        }
        return true
    }
    
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController,animated: true,completion: nil)
    }
    
    @IBAction func mediaFolderTapped(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController,animated: true,completion: nil)
    }
    
    
    
    
    
}
