//
//  NameTableViewController.swift
//  t5
//
//  Created by Admin on 19/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import os.log

class NameTableViewController: UITableViewController,  UITextFieldDelegate {
    
    @IBOutlet weak var save: UIBarButtonItem!
    

    var name = [String]()
    var test = 0
    var arrayOfNames : [String] = [String]()
    var rowBeingEdited : Int? = nil
    
    
    override func viewDidLoad() {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "NameTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NameTableViewCell  else {
            fatalError("The dequeued cell is not an instance of NameTableViewCell.")
        }
        
        cell.nameLabel.text = name[indexPath.row]
        arrayOfNames.append(name[indexPath.row])
        cell.nameLabel.tag = indexPath.row
        cell.nameLabel.delegate = self
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let row = textField.tag
        if row >= arrayOfNames.count {
            var addRow = arrayOfNames.count
            for addRow in addRow ..< row+1 {
                arrayOfNames.append("") // this adds blank rows in case the user skips rows
            }
        }
        arrayOfNames[row] = textField.text!
        rowBeingEdited = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        rowBeingEdited = textField.tag
            }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)

        
        switch(segue.identifier ?? "") {
            
        case "addNames":
            guard let homeViewController = segue.destination as? ViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            if(rowBeingEdited != nil){
                let row = rowBeingEdited
                let indexPath1 = IndexPath(row: row!, section: 0)
                let cell = self.tableView.cellForRow(at: indexPath1) as! NameTableViewCell?
                cell?.nameLabel.resignFirstResponder()
            }
            homeViewController.names = arrayOfNames;
            homeViewController.numberPlayers = arrayOfNames.count
            
            
            print(arrayOfNames)

            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    @IBAction func saveButton(_ sender: Any) {
        if(rowBeingEdited != nil){
        let row = rowBeingEdited
            let indexPath = IndexPath(row: row!, section: 0)
            let cell = self.tableView.cellForRow(at: indexPath) as! NameTableViewCell?
            cell?.nameLabel.resignFirstResponder()
        }

        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true);
 
    }
}
