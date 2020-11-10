//
//  WeatherListViewModel.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

/**
- This is ViewModel for WeatherList and i have tried to divide further into "WeatherListResource" file (to handle APIs).
- If there is another API to be used in WeatherList View Controller  then we can create another function here and map it with "WeatherListResource" file.
*/

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
