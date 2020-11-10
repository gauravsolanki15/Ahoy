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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell", for: indexPath) as! WeatherTableViewCell
        
        let weather = weatherListsData?.list?[indexPath.item]
        cell.configureCell(with: weather)
        
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
