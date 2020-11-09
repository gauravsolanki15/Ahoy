//
//  WeatherListsResource.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import Foundation

struct WeatherListResource
{
    func getWeatherLists(completion: @escaping(_ result : WeatherListResponse?) -> Void)
    {
        let httpUtility = HttpUtility()

        let weatherEndpoint = "\(ApiEndpoints.weatherLists)forecast?q=\(Constants.city)&cnt=\(Constants.forecastDays)&APPID=\(Constants.apiKey)"

        let requestUrl = URL(string:weatherEndpoint)!
        print(requestUrl)

        httpUtility.getApiData(requestUrl: requestUrl, resultType: WeatherListResponse.self) { (categoryApiResponse) in

            _ = completion(categoryApiResponse)
        }
    }
    
    
}
