//
//  StatsViewController.swift
//  t5
//
//  Created by Admin on 05/03/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var statsArray = [[String]]()
    var tableArray = [[String]]()
    var names = [String]()
    let reuseIdentifier = "cell"


    @IBOutlet weak var statsTable: UICollectionView!
    @IBOutlet weak var figures: UILabel!

    @IBOutlet weak var scrollV: UIScrollView!
    
    override func viewDidLoad() {
        self.scrollV.contentSize = self.statsTable.frame.size;
        var newNames = names
        newNames.insert("", at: 0)
        tableArray.append(newNames)
        for i in 0..<statsArray.count{
            var tempArray = [String]()
            tempArray.append(names[i])
            for j in 0..<statsArray[i].count{
                tempArray.append(statsArray[i][j])
            }
            tableArray.append(tempArray)
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let rows = tableArray.count + 3
        scrollV.contentSize = CGSize(width: 375, height: rows*50)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return tableArray.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return tableArray[section].count
    }
    
     func collectionView(_ collectionView: UICollectionView,
                                 layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        
        return CGSize(width: 50, height: 50);
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! StatsCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
       cell.label.text = tableArray[indexPath.section][indexPath.item]

        
        return cell
    }

    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


