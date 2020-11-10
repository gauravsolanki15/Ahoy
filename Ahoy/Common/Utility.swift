//
//  Utility.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

/*
 - Created this file which will have all generalized function that can be used in many files in the project.
 - We can create all commonly used functions here so that we can have access from one file.
*/

import Foundation

class Utility {
    
    func getDate_TimeFromInterval(timeInterval: TimeInterval, format: String) -> String {
        
        let date = NSDate(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //"dd, MMMM yyyy HH:mm:a"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let dateString = dateFormatter.string(from: date as Date)
        
        return dateString
    }
    
}


