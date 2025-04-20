//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mauricio Parada on 19/4/25.
//


// WeatherViewModel.swift

import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "Loading..."
    @Published var temperature: Int = 0
    @Published var condition: String = ""
    @Published var forecast: [ForecastDay] = []

    private let apiKey = "API-KEY"

    func fetchWeather(for city: String = "Jucuapa") {
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(city)&days=6&aqi=no"  
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL.")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.cityName = weather.location.name
                        self.temperature = Int(weather.current.temp_c)
                        self.condition = weather.current.condition.text
                        self.forecast = weather.forecast.forecastday
                    }
                } catch {
                    print("Decoding error:", error)
                }
            } else if let error = error {
                print("Error fetching weather data:", error)
            }
        }.resume()
    }

    // WeatherViewModel.swift
    func weatherIcon(for condition: String, isNight: Bool) -> String {
        print("Mapping condition: \(condition), isNight: \(isNight)")
        switch condition.lowercased() {
        case "clear":
            return isNight ? "moon.stars.fill" : "sun.max.fill"
        case "partly cloudy":
            return isNight ? "cloud.moon.fill" : "cloud.sun.fill"
        case "cloudy":
            return "cloud.fill"
        case "rain":
            return isNight ? "cloud.rain.fill" : "cloud.sun.rain.fill"
        case "thunderstorm":
            return isNight ? "cloud.bolt.rain.fill" : "cloud.bolt.fill"
        case "snow":
            return isNight ? "snowflake" : "cloud.snow.fill"
        case "fog":
            return isNight ? "cloud.fog.fill" : "cloud.sun.fog.fill"
        case "windy":
            return "wind"
        case "hail":
            return "cloud.hail.fill"
        case "dust":
            return "cloud.dust.fill"
        case "mist":
            return isNight ? "cloud.moon.fill" : "cloud.sun.fill" 
        default:
            return isNight ? "moon.stars.fill" : "cloud.sun.fill" // Default icon for unknown condition
        }
    }


}

