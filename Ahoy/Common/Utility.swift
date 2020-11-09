//
//  Utility.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import Foundation

class Utility {
    
    func getDate_TimeFromInterval(timeInterval: TimeInterval, format: String) -> String {
        
        let date = NSDate(timeIntervalSince1970: timeInterval)
        //Date formatting
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format //"dd, MMMM yyyy HH:mm:a"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let dateString = dateFormatter.string(from: date as Date)
        print("formatted date is =  \(dateString)")
        
        return dateString
    }
    
}

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
    
    
    
}

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}


