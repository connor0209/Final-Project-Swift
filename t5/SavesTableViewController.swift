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
    var saveStats = Dictionary<String,[[String]]>()
    var newFile = [String]()
    var newStats = [[String]]()
    var newNames = [String]()
    var saveNames = Dictionary<String,[String]>()
    var isSave:Int = 0
    var saveName:String?
    var selectedCell:String = "POP"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.loadFile()

        if(isSave == 1){
            saveFileName()
            /*let alert = UIAlertController(title: "Save", message: "Enter a Name", preferredStyle: .alert)
        
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
          */
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func saveFileName(){
        let alert = UIAlertController(title: "Save", message: "Enter a Valid Name", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            if(textField?.text == ""){
                self.saveFileName()
                return
            }
            self.saveName = textField?.text
            self.addFile()
            self.saveFile()
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func addFile(){
        saveFiles[saveName!] = newFile
        saveStats[saveName!] = newStats
        saveNames[saveName!] = newNames
        fileNames.append(saveName!)
    }
    
    func saveFile(){
        let array1 = fileNames
        let defaults1 = UserDefaults.standard
        defaults1.set(array1, forKey: "SavedStringArray")
        let array2 = saveFiles
        let defaults2 = UserDefaults.standard
        defaults2.set(array2, forKey: "SavedFileArray")
        let array3 = saveStats
        let defaults3 = UserDefaults.standard
        defaults3.set(array3, forKey: "SavedStatsArray")
        let array4 = saveNames
        let defaults4 = UserDefaults.standard
        defaults4.set(array4, forKey: "SavedNamesArray")
        isSave = 0;
        self.tableView.reloadData()
 
    }
    
    func loadFile(){
        
        let defaults1 = UserDefaults.standard
        let array1 = defaults1.array(forKey: "SavedStringArray")  as? [String] ?? [String]()
        fileNames = array1
        let defaults2 = UserDefaults.standard
        let array2 = defaults2.dictionary(forKey: "SavedFileArray")  as? Dictionary<String,[String]> ?? Dictionary<String,[String]>()
        saveFiles = array2
        let defaults3 = UserDefaults.standard
        let array3 = defaults3.dictionary(forKey: "SavedStatsArray")  as? Dictionary<String,[[String]]> ?? Dictionary<String,[[String]]>()
        saveStats = array3
        let defaults4 = UserDefaults.standard
        let array4 = defaults4.dictionary(forKey: "SavedNamesArray")  as? Dictionary<String,[String]> ?? Dictionary<String,[String]>()
        saveNames = array4



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
        if(indexPath.row%2 == 1){
            cell.backgroundColor = UIColor(red:0.65, green:0.83, blue:0.62, alpha:1.0)
        }
        else{
          cell.backgroundColor = UIColor(red:0.61, green:0.70, blue:0.50, alpha:1.0)
        }
        selectedCell = fileNames[indexPath.row]
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let temp = fileNames[indexPath.row]
            saveFiles.removeValue(forKey: temp)
            saveStats.removeValue(forKey: temp)
            fileNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveFile()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "ShowSaveDetail":
            guard let roundViewController = segue.destination as? LoadTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            if let cell = sender as? SaveFileTableViewCell, let indexPath = tableView.indexPath(for: cell) {
                selectedCell = cell.saveLabel.text!
                
            }

            var results = saveFiles[selectedCell]
            for i in 0..<results!.count {
                roundViewController.round.append(results![i])
           }
            roundViewController.stats = saveStats[selectedCell]!
            roundViewController.pNames = saveNames[selectedCell]!
        case "Home":
            guard let homeViewController = segue.destination as? HomeScreenViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
           }
    
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
}
