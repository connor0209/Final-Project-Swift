//
//  LoadTableViewController.swift
//  t5
//
//  Created by Admin on 28/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class LoadTableViewController: UITableViewController {

    //MARK: Properties
    
    var round = [String]()
    var cellImages = [UIImage]()
    var pNames = [String]() // DOES NOTHING ATM
    var saveName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellImages = [
            UIImage(named: "golf")!,
            UIImage(named: "golf2")!,
            UIImage(named: "golf3")!,
            UIImage(named: "golf4")!,
            UIImage(named: "golf5")!,
            UIImage(named: "golf6")!,
            UIImage(named: "golf7")!,
            UIImage(named: "golf8")!
        ]

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return round.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "LoadTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LoadTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RoundTableViewCell.")
        }
        
        
        cell.nameLabel.text = "Round " + String(indexPath.row + 1)
        if(indexPath.row > 7){
            let i = indexPath.row % 7
            cell.cellImage.image = cellImages[i-1]
            
        }
        else{
            cell.cellImage.image = cellImages[indexPath.row]
        }

        
        return cell
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
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "ShowDetail":
            guard let roundDetailViewController = segue.destination as? GroupDisplayViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedRoundCell = sender as? LoadTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedRoundCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedRound = round[indexPath.row]
            roundDetailViewController.details = selectedRound
      
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }

}
