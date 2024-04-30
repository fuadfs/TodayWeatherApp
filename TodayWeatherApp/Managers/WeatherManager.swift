//
//  WeatherManager.swift
//  TodayWeatherApp
//
//  Created by Fuad Fadlila Surenggana on 30/04/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather (latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("1e43f89fbda383fef4650a4e1451e96f")&units=metric") else { fatalError("Missing URL") }
            
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error Fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}
