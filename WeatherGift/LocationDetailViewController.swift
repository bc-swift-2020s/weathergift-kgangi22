//
//  LocationDetailViewController.swift
//  WeatherGift
//
//  Created by Kyle Gangi on 3/12/20.
//  Copyright © 2020 Kyle Gangi. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var weatherLocation: WeatherLocation!
    var weatherLocations: [WeatherLocation] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if weatherLocation == nil{
            weatherLocation = WeatherLocation(name: "Current Location", latitude: 0.0, longitude: 0.0)
            weatherLocations.append(weatherLocation)
        }
        loadLocations()
        updateUserInterface()

        // Do any additional setup after loading the view.
    }
    
    func loadLocations(){
        guard let locationsEncoded = UserDefaults.standard.value(forKey: "weatherLocations") as? Data
            else{
                print("Warning: Could not load weatherLocations data. This would always be the case the first time the app is installed")
                return
        }
        let decoder = JSONDecoder()
        if let weatherLocations = try? decoder.decode(Array.self, from: locationsEncoded) as [WeatherLocation]{
            self.weatherLocations = weatherLocations
        } else{
            print("Error")
        }
    }
    
    func updateUserInterface(){
        dateLabel.text = ""
        placeLabel.text = weatherLocation.name
        temperatureLabel.text = "--°"
        summaryLabel.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! LocationListViewController
        destination.weatherLocations = weatherLocations
    }
    
    @IBAction func unwindFromLocationListViewController(segue: UIStoryboardSegue){
        let source = segue.source as! LocationListViewController
        weatherLocations = source.weatherLocations
        weatherLocation = weatherLocations[source.selectedLocationIndex]
        updateUserInterface()
        
        
        
    }
    

}
