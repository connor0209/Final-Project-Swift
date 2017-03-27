//
//  GroupDisplayViewController.swift
//  t5
//
//  Created by Admin on 18/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class GroupDisplayViewController: UIViewController {


    @IBOutlet weak var groups: UITextView!
    var details:String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups.isEditable = false
        groups.text = details;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
