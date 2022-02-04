//
//  WeatherManager.swift
//  Clima
//
//  Created by 임창용 on 2022/01/28.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager ,weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager{
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=fa727845710c66a754497a8a3da8cbe1&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        self.performRequest(with: urlString)
    }
    
    func fetchWeather(latitude : Double, longitude : Double){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        self.performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        
        //Networking 순서
        //1. Create a url
        
        if let url = URL(string: urlString){
            //2. Create a URLSession
            
            let session = URLSession(configuration: .default)
        
            //3. Give the session a task
            
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data{
                    if let weather = self.parseJSON(weatherData: safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            })
            //let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            //4. Start the task
            task.resume()
        }
        
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? { //catch문에서 WeatherModel 데이터 형으로 잡을수 없기 때문에                                                      nil을 쓰려고 하는데, 그러려면 optional을 이용해서 nil을 추가할 수                                                   있게 해준다.
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weather
            
        } catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
//    func getCondition() -> String{
//        return getConditionName(weatherId: id)
//    }
    
    
}
