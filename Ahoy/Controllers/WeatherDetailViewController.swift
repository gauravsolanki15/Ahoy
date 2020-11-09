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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    

    private func configureUI(){
                
     //   filmsTableView.register(UINib(nibName: "FilmsTableViewCell", bundle: nil), forCellReuseIdentifier: "FilmsTableViewCell")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

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
