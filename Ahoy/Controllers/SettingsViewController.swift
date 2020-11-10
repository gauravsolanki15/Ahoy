//
//  SettingsViewController.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segmentCtrlTemp: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Settings"
        segmentCtrlTemp.setTitle(NSString(format:"C%@" as NSString, "\u{00B0}") as String, forSegmentAt: 0)
        segmentCtrlTemp.setTitle(NSString(format:"F%@" as NSString, "\u{00B0}") as String, forSegmentAt: 1)
        
        if UserDefaultsClass.sharedInstance.getTempUnit() == "metric" {
            segmentCtrlTemp.selectedSegmentIndex = 0
        }else{
            segmentCtrlTemp.selectedSegmentIndex = 1
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeTempUnit(_ sender: Any) {
        
        switch segmentCtrlTemp.selectedSegmentIndex
        {
        case 0:
            print("C")
            UserDefaultsClass.sharedInstance.setTempUnit(unit: "metric")
        case 1:
            UserDefaultsClass.sharedInstance.setTempUnit(unit: "imperial")
        default:
            break;
        }
        
    }
    

}
