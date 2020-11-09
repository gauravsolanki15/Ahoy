//
//  WeatherTableViewCell.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet var viewBg: UIView!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblTime: UILabel!
    
    @IBOutlet var imgViewWeather: UIImageView!
    
    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var lblTemp: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
