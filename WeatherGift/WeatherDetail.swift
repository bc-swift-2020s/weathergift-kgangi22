//
//  WeatherDetail.swift
//  WeatherGift
//
//  Created by Kyle Gangi on 3/20/20.
//  Copyright © 2020 Kyle Gangi. All rights reserved.
//

import Foundation

class WeatherDetail: WeatherLocation{
    
    struct Result: Codable {
        var timezone: String
        var currently: Currently
        var daily: Daily
    }
    
    struct Currently: Codable {
        var temperature: Double
    }
    
    struct Daily: Codable{
        var summary: String
    }
    
    
    var timeZone = ""
    var temperature = 0
    var summary = ""
    
    func getData(completed: @escaping () -> () ){
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIkeys.darkSkyKey)/\(coordinates)"
    
        print("❤️❤️❤️❤️❤️❤️ We are accessing \(urlString)")
        guard let url = URL(string: urlString) else{
            print("ERROR: Could not create URL with \(urlString)")
            completed()
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            do{
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.timeZone = result.timezone
                self.temperature = Int(result.currently.temperature.rounded())
                self.summary = result.daily.summary
                
            } catch{
                print("JSON Error: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
        
        
        
        
        
    }
}
