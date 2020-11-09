//
//  ViewController.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {

    @IBOutlet weak var tableViewWeather: UITableView!
    let weatherViewModel : WeatherListViewModel = WeatherListViewModel()
    var weatherListsData: WeatherListResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Forecast"
        setupTableView()
        getWeatherListsFromAPI()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView(){
        tableViewWeather.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")
    }
    
    private func getWeatherListsFromAPI(){
        weatherViewModel.getWeatherListData { (weatherApiResponse) in
            if(weatherApiResponse != nil) {
             //   print(personApiResponse?.count as Any)
                
                self.weatherListsData = weatherApiResponse!
              /*  self.weatherListsData?.results = weatherApiResponse!.results?.sorted(by: { ($0.name!) < ($1.name!)})
                */
                DispatchQueue.main.async {
                    self.tableViewWeather.reloadData()
                }
            }
        }
    }

}

