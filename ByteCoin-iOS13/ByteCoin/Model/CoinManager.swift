//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    func didUpdateCoin(_ coinManager: CoinManager ,coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "00F78A07-9EED-46D9-8868-492924904837"
    
    var delegate = CoinManagerDelegate?
    
    func fetchWeather(currencyName: String){
        let urlString = "\(baseURL)USD?apikey=\(apiKey)"
        self.performRequest(with: urlString)
    }
    
    func getCoinPrice(for currency: String){
        
    }
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){(data,response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let coin = self.parseJSON(coinData: safeData){
                        self.delegate?.didUpdateWeather(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(coinData: Data) -> CoinModel? { //catch문에서 WeatherModel 데이터 형으로 잡을수 없기 때문에                                                      nil을 쓰려고 하는데, 그러려면 optional을 이용해서 nil을                                                    추가할 수 있게 해준다.
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            let coin = CoinModel(rate: rate)
            
            return coin
            
        } catch{
            self.delegate.didFailWithError(error: error)
            return nil
        }
    }
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
}
