//
//  UserDefaultsClass.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 10/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import Foundation

class UserDefaultsClass {
    
    class var sharedInstance: UserDefaultsClass {
        struct Singleton {
            static let instance = UserDefaultsClass()
            
        }
        return Singleton.instance
    }
    
    
    func setTempUnit(unit:String?) {
        UserDefaults.standard.set(unit, forKey: "TemperatureUnit")
    }
    func getTempUnit()->String? {
        return UserDefaults.standard.value(forKey: "TemperatureUnit") as? String
    }
    
    
    //UserDefaultsClass.sharedInstance.getTempUnit() ?? ""
    
    
}
