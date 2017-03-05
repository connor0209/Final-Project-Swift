//
//  StatsViewController.swift
//  t5
//
//  Created by Admin on 05/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    
    var statsArray = [[String]]()
    var names = [String]()

    @IBOutlet weak var figures: UILabel!
    override func viewDidLoad() {
        fillTable()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillTable(){
        var columnText = ""
        for i in 0..<names.count{
            columnText.append(names[i])
            columnText.append("\t")
        }

        var rowText = ""
        for i in 0..<names.count{
            rowText.append(names[i])
            rowText.append("\n\n")
        }
   
        
        var finalFigures = ""
        for i in 0..<statsArray.count{
            var temp = statsArray[i]
            var temp2 = ""
            for j in 0..<temp.count{
                temp2.append(temp[j] + "\t")
            }
            finalFigures.append(temp2 + "\n")
        }
        print(finalFigures)
        print(columnText)
        var finalFiguresWithColumn = columnText + "\n" + finalFigures
         figures.text = finalFiguresWithColumn
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
