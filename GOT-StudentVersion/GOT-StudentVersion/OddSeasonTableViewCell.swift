//
//  OddSeasonTableViewCell.swift
//  GOT-StudentVersion
//
//  Created by Keshawn Swanston on 11/8/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class OddSeasonTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var oddImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ssnDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
