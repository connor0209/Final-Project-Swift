//
//  SavesTableViewController.swift
//  t5
//
//  Created by Admin on 24/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class SavesTableViewController: UITableViewController {
    
    var saveFiles = Dictionary<String,[String]>()
    var fileNames = [String]()
    var newFile = [String]()
    var isSave:Int = 0
    var saveName:String?
    var selectedCell:String = "POP"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.loadFile()
        print("CHECKING SAVE FILES")
        print(saveFiles)
        if(isSave == 1){
            let alert = UIAlertController(title: "Save", message: "Enter a Name", preferredStyle: .alert)
        
            alert.addTextField { (textField) in
                textField.text = ""
            }
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0]
                self.saveName = textField?.text
                self.addFile()
                self.saveFile()
            
            }))
            self.present(alert, animated: true, completion: nil)
            
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func addFile(){
        saveFiles[saveName!] = newFile
        fileNames.append(saveName!)
    }
    
    func saveFile(){
        //fileNames.removeAll()
        //saveFiles.removeAll()
        print("SAVING")
        let array1 = fileNames
        let defaults1 = UserDefaults.standard
        defaults1.set(array1, forKey: "SavedStringArray")
        let array2 = saveFiles
        let defaults2 = UserDefaults.standard
        defaults2.set(array2, forKey: "SavedFileArray")
        isSave = 0;
        self.tableView.reloadData()
 
    }
    
    func loadFile(){
        print("LoadING")
        
        let defaults1 = UserDefaults.standard
        let array1 = defaults1.array(forKey: "SavedStringArray")  as? [String] ?? [String]()
        fileNames = array1
        let defaults2 = UserDefaults.standard
        let array2 = defaults2.dictionary(forKey: "SavedFileArray")  as? Dictionary<String,[String]> ?? Dictionary<String,[String]>()
        saveFiles = array2


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
        return fileNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SaveFileTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SaveFileTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RoundTableViewCell.")
        }
        
        
        cell.saveLabel.text = fileNames[indexPath.row]
        selectedCell = fileNames[indexPath.row]
        
        return cell
    }

    override  func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        NSLog("You selected cell number: \(indexPath.row)!")
        // get text in label nameLabel
        let cell = tableView.cellForRow(at: indexPath) as! SaveFileTableViewCell
        
        // here is the text of the label
        selectedCell = cell.saveLabel.text!
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let temp = fileNames[indexPath.row]
            saveFiles.removeValue(forKey: temp)
            fileNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveFile()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "ShowSaveDetail":
            guard let roundViewController = segue.destination as? LoadTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            print("SELECTED CELL")
            print(selectedCell)
            print(fileNames)
            var results = saveFiles[selectedCell]
            for i in 0..<results!.count {
                roundViewController.round.append(results![i])
           }
        case "Home":
            guard let homeViewController = segue.destination as? HomeScreenViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
    
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }

}
