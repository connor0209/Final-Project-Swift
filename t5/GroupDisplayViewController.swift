//
//  GroupDisplayViewController.swift
//  t5
//
//  Created by Admin on 18/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class GroupDisplayViewController: UIViewController {

    @IBOutlet weak var groups: UILabel!
    var details:String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups.numberOfLines = 0;
        groups.text = details;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
