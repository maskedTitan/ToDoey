//
//  ViewController.swift
//  ToDoey
//
//  Created by Harsha Marri on 02/12/18.
//  Copyright © 2018 Harsha M. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    
    var itemArray = ["Find Mike" , "Find Eleven" , "Destroy Demogorgons"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
//            itemArray = items
        itemArray = defaults.array(forKey: "ToDoListArray") as! [String]
   }
//

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
          cell.textLabel?.text = itemArray[indexPath.row]

        return cell

    }
//    //MARK - TABLEVIEW DELEGATE METHODS
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
//    //MARK - ADD NEW ITEMS SECTION
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the button

            self.itemArray.append(textField.text!)
            self.tableView.reloadData()

            self.defaults.set(self.itemArray, forKey: "ToDoListArray")


        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}



