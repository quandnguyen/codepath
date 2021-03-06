//
//  TipsCell.swift
//  StyleCast
//
//  Created by Kim, YoungKyo (CONT) on 11/6/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class TipsCell: UITableViewCell {
    @IBOutlet weak var userNameView: UILabel!
    @IBOutlet weak var messageView: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var timeStampView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
