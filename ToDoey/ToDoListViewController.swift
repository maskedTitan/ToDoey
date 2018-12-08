//
//  ViewController.swift
//  ToDoey
//
//  Created by Harsha Marri on 02/12/18.
//  Copyright © 2018 Harsha M. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    
    let itemArray = ["Find Mike" , "Find Eleven" , "Destroy Demogorgons"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
          cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    //MARK - TABLEVIEW DELEGATE METHODS
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  print(itemArray[indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
       
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
         tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
    }
}

