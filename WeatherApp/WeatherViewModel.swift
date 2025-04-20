//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mauricio Parada on 19/4/25.
//


// WeatherViewModel.swift

// WeatherViewModel.swift
import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var cityName: String = "Loading..."
    @Published var temperature: Int = 0
    @Published var condition: String = ""
    @Published var forecast: [ForecastDay] = []

    private let apiKey = "YOUR_API_KEY"

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

    // Function to map weather condition to SF Symbols
    func weatherIcon(for condition: String) -> String {
        switch condition.lowercased() {
        case "clear":
            return "sun.max.fill"
        case "partly cloudy":
            return "cloud.sun.fill"
        case "cloudy":
            return "cloud.fill"
        case "rain":
            return "cloud.rain.fill"
        case "thunderstorm":
            return "cloud.bolt.rain.fill"
        case "snow":
            return "snowflake"
        case "fog":
            return "cloud.fog.fill"
        case "windy":
            return "wind"
        default:
            return "cloud.sun.fill" // Default icon for unknown conditions
        }
    }
}

