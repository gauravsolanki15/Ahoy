//
//  WeatherListsVCExtension.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import Foundation
import UIKit

extension WeatherListViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListsData?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
    /*
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        var lastInitialDisplayableCell = false

        //change flag as soon as last displayable cell is being loaded (which will mean table has initially loaded)
        if weatherListsData?.results?.count ?? 0 > 0 && !finishedLoadingInitialTableCells {
            if let indexPathsForVisibleRows = tableView.indexPathsForVisibleRows,
                let lastIndexPath = indexPathsForVisibleRows.last, lastIndexPath.row == indexPath.row {
                lastInitialDisplayableCell = true
            }
        }

        if !finishedLoadingInitialTableCells {
            if lastInitialDisplayableCell {
                finishedLoadingInitialTableCells = true
            }
            //animates the cell as it is being displayed for the first time
            cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.size.height/2)
            cell.alpha = 0

            UIView.animate(withDuration: 0.5, delay: 0.05*Double(indexPath.row), options: [.curveEaseInOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
                cell.alpha = 1
            }, completion: nil)
        }
    }
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
            
        let weather = weatherListsData?.list?[indexPath.item].weather
        if weather?.count ?? 0 > 0 {
           
            //TimeStamp
            let timeInterval = TimeInterval(weatherListsData?.list?[indexPath.item].dt ?? 0)
            print("time interval is \(timeInterval)")
            
            cell.lblDate.text = Utility().getDate_TimeFromInterval(timeInterval: timeInterval, format: "dd, MMMM") //weather?[0].main ?? ""
            
            cell.lblTime.text = Utility().getDate_TimeFromInterval(timeInterval: timeInterval, format: "HH:mm:a")
                        
            let imageName = weather?[0].main ?? ""
            cell.imgViewWeather.image = UIImage(named: "\(imageName)")
            
            cell.lblDesc.text = weather?[0].main ?? ""
            let minTemp = String(format: "%.2f", weatherListsData?.list?[indexPath.item].main?.tempMin ?? "")

            let maxTemp = String(format: "%.2f", weatherListsData?.list?[indexPath.item].main?.tempMax ?? "")

            cell.lblTemp.text = "\(minTemp) - \(maxTemp)"
            
          //  "\(weatherListsData?.list?[indexPath.item].main?.tempMin) - \(weatherListsData?.list?[indexPath.item].main?.tempMax)"
            
        }
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let list = weatherListsData?.list?[indexPath.item]
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController
        controller.weatherData = list
        self.navigationController?.pushViewController(controller, animated: true)
        
    }

}
