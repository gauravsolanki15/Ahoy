//
//  WeatherListViewModel.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import Foundation

struct WeatherListViewModel
{
    func getWeatherListData(completion: @escaping(_ result: WeatherListResponse?)-> Void) {

        let weatherListResource = WeatherListResource()
        weatherListResource.getWeatherLists { (weatherApiResponse) in
            _ = completion(weatherApiResponse)
        }
    }
}
