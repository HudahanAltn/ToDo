//
//  ViewController.swift
//  ToDo
//
//  Created by Hüdahan Altun on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var toDoTableView: UITableView!
    
    var doItemList:[String] = ["take the dog for a walk","go shopping","buy new clothes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //connect our tableview with viewcontroller
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
    }


    @IBAction func addButtonPressed(_ sender: Any) {
        
        var newTextField = UITextField() //created to use  whole scope
        
        let alertController = UIAlertController(title: "Add new toDo Item", message: "", preferredStyle: .alert) // alert controller object
        
        let addItem = UIAlertAction(title: "Add Item", style: .default){ //alert Button
            
            action in
            
            print("action is pressed")
            
            if let textInAlert = newTextField.text{
                // we added new ıtem to our list
                self.doItemList.append(textInAlert)
            }
            
            DispatchQueue.main.async { // created thread to when user add new todo , table view show us instantly
                
                self.toDoTableView.reloadData()
            }
        }
        
        alertController.addTextField(){ // we add textfield into alert
            
            
            alertTF in
            
            alertTF.placeholder = "add new item"
            
            newTextField = alertTF // copy alertTF to newTextField that created the beginning of scope
            
        }
        
        alertController.addAction(addItem)
        
        self.present(alertController, animated: true)
    }
}


extension ViewController:UITableViewDataSource,UITableViewDelegate{//add delegate and data source method
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return doItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell",for:indexPath)
        
        cell.textLabel?.text = doItemList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(doItemList[indexPath.row])
        
        //we will control that has the cell checkmark?
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            //yes we delete checkmark
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            //no we add checkkmark
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        


        tableView.deselectRow(at: indexPath, animated: true)//when clicked the cell ,we won't see anymore gray view continiously
    }
}
