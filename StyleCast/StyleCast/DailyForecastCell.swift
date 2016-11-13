//
//  DailyForecastCell.swift
//  StyleCast
//
//  Created by Nguyen, Quan on 11/13/16.
//  Copyright © 2016 Nguyen, Quan. All rights reserved.
//

import UIKit

class DailyForecastCell: UITableViewCell {
    @IBOutlet weak var weatherIconView: UIImageView!
    @IBOutlet weak var dayView: UILabel!
    @IBOutlet weak var lowTempView: UILabel!
    @IBOutlet weak var highTempView: UILabel!
    @IBOutlet weak var weatherConditionView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
