//
//  ViewController.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

/**
- This is first Screen to be shown and have kept mapping from Storyboard.
- I have tried to keep the ViewController file as short as possible by adding just UI relevant things. Rest is done in ViewModel, Views, Model, etc.
- I believe to keep ViewController to be around 100 lines.
*/

import UIKit

class WeatherListViewController: UIViewController {

    @IBOutlet weak var tableViewWeather: UITableView!
    let weatherViewModel : WeatherListViewModel = WeatherListViewModel()
    var weatherListsData: WeatherListResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupTableView()
        getWeatherListsFromAPI()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView(){
        tableViewWeather.register(UINib(nibName: "WeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherTableViewCell")
    }
    
    private func configureUI(){
        self.navigationItem.title = "Forecast"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settings"),
        style: .plain,
        target: self,
        action: #selector(openSettings))
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshData), name: NSNotification.Name.init("TempUnitChanged"), object: nil)
        
    }
    
    @objc func refreshData() {
        
        DispatchQueue.main.async {
            self.getWeatherListsFromAPI()
        }
    }
    
    @objc func openSettings() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(controller, animated: true)
        
    }

        
    private func getWeatherListsFromAPI(){
        weatherViewModel.getWeatherListData { (weatherApiResponse) in
            if(weatherApiResponse != nil) {
                
                self.weatherListsData = weatherApiResponse!
                DispatchQueue.main.async {
                    self.tableViewWeather.reloadData()
                }
            }
        }
    }

}

