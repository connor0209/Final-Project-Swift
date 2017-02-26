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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
        //cell.nameLabel.text = "" // just in case cells are re-used, this clears the old value
        cell.nameLabel.tag = indexPath.row
        cell.nameLabel.delegate = self
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("INHERE")
        let row = textField.tag
        print(row)
        print(arrayOfNames.count )
        if row >= arrayOfNames.count {
            print("here")
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

   /* override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: IndexPath) {
        let cellIdentifier = "NameTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NameTableViewCell // do not confuse this with the similarly named `tableView:cellForRowAtIndexPath:` method that you've implemented
        name[indexPath.row] = (cell?.nameLabel.text!)!
        
    }
    */
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
        
        //let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        //self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true);
     
        //navigationController?.popToViewController(myVC, animated: true)
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true);
 
    }

       /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
