//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Kyle Gangi on 3/8/20.
//  Copyright © 2020 Kyle Gangi. All rights reserved.
//

import Foundation


class WeatherLocation: Codable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double){
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getData(){
        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.darkSkyURL)\(APIkeys.darkSkyKey)/\(coordinates)"
    
        print("❤️❤️❤️❤️❤️❤️ We are accessing \(urlString)")
        guard let url = URL(string: urlString) else{
            print("ERROR: Could not create URL with \(urlString)")
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print("\(json)")
                
            } catch{
                print("JSON Error: \(error.localizedDescription)")
                
            }
        }
        
        task.resume()
        
        
        
        
        
    }
}
