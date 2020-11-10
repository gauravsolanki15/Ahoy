//
//  WeatherListsResource.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//


/**
- This Resource file will be used to define APIs functions that can be used in WeatherList View Controller related stuffs and from here it will call "HttpUtility" to get the defined data.
- Here, we are creating request parameters to be sent to "HttpUtility" class.
- I have created this file in order to further divide the ViewModel code so that WeatherListViewModel doesnt get huge.
*/

import Foundation

struct WeatherListResource
{
    func getWeatherLists(completion: @escaping(_ result : WeatherListResponse?) -> Void)
    {
        let httpUtility = HttpUtility()

        let weatherEndpoint = "\(ApiEndpoints.weatherLists)forecast?q=\(Constants.city)&cnt=\(Constants.forecastDays)&units=\(String(describing: UserDefaultsClass.sharedInstance.getTempUnit() ?? ""))&APPID=\(Constants.apiKey)"

        let requestUrl = URL(string:weatherEndpoint)!
        print(requestUrl)

        httpUtility.getApiData(requestUrl: requestUrl, resultType: WeatherListResponse.self) { (categoryApiResponse) in

            _ = completion(categoryApiResponse)
        }
    }
    
    
}


