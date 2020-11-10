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
    var tempUnitValue = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI(){
        self.navigationItem.title = "Settings"
        segmentCtrlTemp.setTitle(NSString(format:"C%@" as NSString, "\u{00B0}") as String, forSegmentAt: 0)
        segmentCtrlTemp.setTitle(NSString(format:"F%@" as NSString, "\u{00B0}") as String, forSegmentAt: 1)
        
        if UserDefaultsClass.sharedInstance.getTempUnit() == "metric" {
            segmentCtrlTemp.selectedSegmentIndex = 0
        }else{
            segmentCtrlTemp.selectedSegmentIndex = 1
        }
        
        tempUnitValue = UserDefaultsClass.sharedInstance.getTempUnit() ?? ""
    }
    
    @IBAction func changeTempUnit(_ sender: Any) {
        
        switch segmentCtrlTemp.selectedSegmentIndex
        {
        case 0:
            UserDefaultsClass.sharedInstance.setTempUnit(unit: "metric")
        case 1:
            UserDefaultsClass.sharedInstance.setTempUnit(unit: "imperial")
        default:
            break;
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if tempUnitValue != UserDefaultsClass.sharedInstance.getTempUnit() {
            NotificationCenter.default.post(name: NSNotification.Name.init("TempUnitChanged"), object: nil, userInfo: nil)
        }
        
    }
    

}
