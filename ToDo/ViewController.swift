//
//  ViewController.swift
//  ToDo
//
//  Created by Hüdahan Altun on 13.01.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var toDoTableView: UITableView!
    
    let doItemList:[String] = ["take the dog for a walk","go shopping","buy new clothes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //connect our tableview with viewcontroller
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
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
