//
//  ViewController.swift
//  WeatherApp
//
//  Created by M29 on 16/12/19.
//  Copyright © 2019 M29. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     var weathermng = weathertemparaturemanager()
    
    @IBOutlet weak var City_name: UITextField!
    
  
    @IBOutlet weak var weatherTemperature: UITextField!
  var weathermanager = weathertemparaturemanager()
    override func viewDidLoad() {
       
        super.viewDidLoad()
    
        City_name.delegate = self
     weathermanager.delegate = self
        
    }}
//MARK/--UITextFielddelegate

extension ViewController : UITextFieldDelegate {
    @IBAction func search(_ sender: Any) {
            if City_name.text != ""
        {
               City_name.endEditing(true)
          
               }
               else
        {
           City_name.text = "enter enter city name "

               }
    }






 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        City_name.endEditing(true)
     
        return true
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""
        {
            return true
        }
        else
        {
            textField.placeholder = "enter enter city name "
            return false
        }
    }


   
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        if   let city = City_name.text
      {
        weathermng.fetchTemparature(cityname: city)
        }
      
    }
}

//MARK/--weathrmngrdelegate

extension ViewController: weathertemparaturemanagerDelegate {
   
    

    func updateweather(Temp : String)
    {
        
     DispatchQueue.main.async{
  
    self.weatherTemperature.text = Temp
     // print(temparature)
       
    }
    }
   // }
    
    
    func didFailWithError(error : Error)
    {
        print(error)
    }
//}
}


