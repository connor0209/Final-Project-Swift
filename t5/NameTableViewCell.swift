//
//  NameTableViewCell.swift
//  t5
//
//  Created by Admin on 19/02/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class NameTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
