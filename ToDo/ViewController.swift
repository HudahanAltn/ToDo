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
        
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
    }


}


extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
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
}
