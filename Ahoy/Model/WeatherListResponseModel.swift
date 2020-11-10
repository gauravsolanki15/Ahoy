//
//  WeatherListsResponseModel.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

/**
- This file is the Model class of all  APIs defined in "WeatherListResponse" file, like this we can create all Model Class to parse using Codable functionality...
*/

import Foundation

class WeatherListResponse: Codable {
    let cod: String?
    let message, cnt: Int?
    let list: [List]?
    let city: City?

    init(cod: String?, message: Int?, cnt: Int?, list: [List]?, city: City?) {
        self.cod = cod
        self.message = message
        self.cnt = cnt
        self.list = list
        self.city = city
    }
}

// MARK: - City
class City: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let country: String?
    let population, timezone, sunrise, sunset: Int?

    init(id: Int?, name: String?, coord: Coord?, country: String?, population: Int?, timezone: Int?, sunrise: Int?, sunset: Int?) {
        self.id = id
        self.name = name
        self.coord = coord
        self.country = country
        self.population = population
        self.timezone = timezone
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

// MARK: - Coord
class Coord: Codable {
    let lat, lon: Double?

    init(lat: Double?, lon: Double?) {
        self.lat = lat
        self.lon = lon
    }
}

// MARK: - List
class List: Codable {
    let dt: Int?
    let main: Main?
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let visibility: Int?
    let pop: Double?
    let rain: Rain?
    let sys: Sys?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }

    init(dt: Int?, main: Main?, weather: [Weather]?, clouds: Clouds?, wind: Wind?, visibility: Int?, pop: Double?, rain: Rain?, sys: Sys?, dtTxt: String?) {
        self.dt = dt
        self.main = main
        self.weather = weather
        self.clouds = clouds
        self.wind = wind
        self.visibility = visibility
        self.pop = pop
        self.rain = rain
        self.sys = sys
        self.dtTxt = dtTxt
    }
}

// MARK: - Clouds
class Clouds: Codable {
    let all: Int?

    init(all: Int?) {
        self.all = all
    }
}

// MARK: - Main
class Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }

    init(temp: Double?, feelsLike: Double?, tempMin: Double?, tempMax: Double?, pressure: Int?, seaLevel: Int?, grndLevel: Int?, humidity: Int?, tempKf: Double?) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.seaLevel = seaLevel
        self.grndLevel = grndLevel
        self.humidity = humidity
        self.tempKf = tempKf
    }
}

// MARK: - Rain
class Rain: Codable {
    let the3H: Double?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }

    init(the3H: Double?) {
        self.the3H = the3H
    }
}

// MARK: - Sys
class Sys: Codable {
    let pod: String?

    init(pod: String?) {
        self.pod = pod
    }
}

// MARK: - Weather
class Weather: Codable {
    let id: Int?
    let main, weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }

    init(id: Int?, main: String?, weatherDescription: String?, icon: String?) {
        self.id = id
        self.main = main
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}

// MARK: - Wind
class Wind: Codable {
    let speed: Double?
    let deg: Int?

    init(speed: Double?, deg: Int?) {
        self.speed = speed
        self.deg = deg
    }
}
