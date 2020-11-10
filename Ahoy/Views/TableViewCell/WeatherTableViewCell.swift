//
//  WeatherTableViewCell.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

/**
- Created separate "TableViewCell" with its Xibs so that we can utilize same Cell in another View controller if both has same design and values..
- Else creating only separate "TableViewCell.swift" can also work by embeding Cell View inside TableView in Storyboard to be used by View Controller.
 - Here, created "configureCell" functions to set all data in TableView Cell and keeping CellForRowAtIndex function with less code.
*/

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
    
    func configureCell(with cellItem: List?) {
    
        if let cellItem = cellItem {
            let weather = cellItem.weather
            if weather?.count ?? 0 > 0 {
               
                let timeInterval = TimeInterval(cellItem.dt ?? 0)
                lblDate.text = Utility().getDate_TimeFromInterval(timeInterval: timeInterval, format: "dd, MMMM") //weather?[0].main ?? ""
                lblTime.text = Utility().getDate_TimeFromInterval(timeInterval: timeInterval, format: "HH:mm:a")
                            
                let imageName = weather?[0].main ?? ""
                imgViewWeather.image = UIImage(named: "\(imageName)")
                
                lblDesc.text = weather?[0].main ?? ""
                let temp = String(format: "%.2f", cellItem.main?.temp ?? "")
                if UserDefaultsClass.sharedInstance.getTempUnit() == "metric" {
                    lblTemp.text = NSString(format:"\(temp)%@" as NSString, "\u{00B0}") as String + " C"
                }else{
                    lblTemp.text = NSString(format:"\(temp)%@" as NSString, "\u{00B0}") as String + " F"
                }
            }
            self.selectionStyle = UITableViewCell.SelectionStyle.none
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
