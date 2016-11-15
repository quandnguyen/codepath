//
//  LocationViewCell.swift
//  StyleCast
//
//  Created by Nguyen, Quan on 11/14/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class LocationViewCell: UITableViewCell {
    @IBOutlet weak var weatherIconView: UIImageView!
    @IBOutlet weak var tempView: UILabel!
    @IBOutlet weak var locationView: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
