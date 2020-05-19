//
//  weathertemparaturemanager.swift
//  WeatherApp
//
//  Created by M29 on 16/12/19.
//  Copyright © 2019 M29. All rights reserved.
//

import Foundation
protocol weathertemparaturemanagerDelegate
{
   func updateweather(Temp : String)
    func didFailWithError(error : Error)
    
}

class weathertemparaturemanager
{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=15705f7654ed7ee83de50a1af2e507d4&units=metric"
    var delegate: weathertemparaturemanagerDelegate?
  
    
func fetchTemparature(cityname : String)
{
   let urlString = "\(weatherURL)&q=\(cityname)"
    request(with: urlString)

    }
    func request(with urlString : String)
    {
        if let url = URL(string: urlString)
        {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data,  response,  error ) in
                if error != nil {
                        
                    self.delegate?.didFailWithError(error: error!)
                   
                           return
                           
                       }
                
                       if let safedata = data {
                        if let temp =  self.parseJSON( safedata: safedata)
                     { print(temp)
                        let tempr = String(temp)
                      self.delegate?.updateweather(Temp: tempr)
                        //VC.updateweather(description: temp)
                      
                        }
                 
                
                      
            }
            }
            task.resume()
            
        
        
    
    }
    }
    
    func parseJSON(safedata weatherdata : Data) -> Double!
    {//
       let decoder = JSONDecoder()
       do
       {
        let decodedData =  try decoder.decode(weatherData.self, from: weatherdata)
      let temp = decodedData.main.temp
      
     
        return temp
       }  catch{
  self.delegate?.didFailWithError(error : error)
     
        return nil
      
        }
    }
  
        
    }
    

