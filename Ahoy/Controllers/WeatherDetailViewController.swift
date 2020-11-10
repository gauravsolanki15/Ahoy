//
//  WeatherDetailViewController.swift
//  Ahoy
//
//  Created by Gaurav Solanki on 09/11/20.
//  Copyright © 2020 Gaurav Solanki. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var weatherData: List?
    
    @IBOutlet var viewBg: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblAm_Pm: UILabel!
    @IBOutlet weak var imgViewWeather: UIImageView!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblTempDegree: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    

    private func configureUI(){
                
     //   filmsTableView.register(UINib(nibName: "FilmsTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmsTableViewCell")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let timeInterval = TimeInterval(weatherData?.dt ?? 0)
        lblDate.text = Utility().getDate_TimeFromInterval(timeInterval: timeInterval, format: "dd, MMMM")
        lblTime.text = Utility().getDate_TimeFromInterval(timeInterval: timeInterval, format: "HH:mm")
        lblAm_Pm.text = Utility().getDate_TimeFromInterval(timeInterval: timeInterval, format: "a")
        print(lblAm_Pm.text)
        
      /*  if weatherData?.weather?[0].main == "Clouds" {
            self.viewBg.backgroundColor = UIColor.blue
        }else if weatherData?.weather?[0].main == "Clear" {
            self.viewBg.backgroundColor = UIColor.orange
        }else if weatherData?.weather?[0].main == "Rain" {
            self.viewBg.backgroundColor = UIColor.orange
        } */
        
        imgViewWeather.image = UIImage(named: "\(weatherData?.weather?[0].main ?? "")")
        
        let temp = String(format: "%.2f", weatherData?.main?.temp ?? "")
        lblTemp.text = NSString(format:"\(temp)%@" as NSString, "\u{00B0}") as String
        lblDesc.text = weatherData?.weather?[0].main ?? ""
        
        if UserDefaultsClass.sharedInstance.getTempUnit() == "metric" {
            lblTempDegree.text = "C"
        }else{
            lblTempDegree.text = "F"
        }
        
   /*     lblNameValue.text = personData?.name
        lblDOBValue.text = personData?.birthYear
        lblHeightValue.text = personData?.height
        lblWeightValue.text = personData?.mass
        lblHairColorValue.text = personData?.hairColor
        lblSkinColorValue.text = personData?.skinColor
        lblEyeColorValue.text = personData?.eyeColor
        lblGenderValue.text = (personData?.gender).map { $0.rawValue }
    */
    }

}
