// ContentView.swift
// WeatherApp
//
// Created by Mauricio Parada on 14/4/25.

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityInfoView(cityText: viewModel.cityName)

                primaryInfoView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperatureDay: viewModel.temperature
                )

                HStack(spacing: 18) {
                    ForEach(viewModel.forecast.prefix(5), id: \.date) { forecast in
                        WeatherDayView(
                            dayOfWeek: getDayOfWeek(from: forecast.date),
                            imageDay: isNight ? "moon.fill" : "cloud.sun.fill",  
                            temperatureDay: Int(forecast.day.maxtemp_c)
                        )
                    }
                }

                Spacer()

                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", backgrounColor: .white, textColor: .gray)
                }

                Spacer()
            }
        }
        .onAppear {
            viewModel.fetchWeather()
        }
    }

    // Utility function to get the day of the week from the date string
    func getDayOfWeek(from date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: date) {
            let dayFormatter = DateFormatter()
            dayFormatter.dateFormat = "EEE" // Short day of the week (Mon, Tue, etc.)
            return dayFormatter.string(from: date)
        }
        return ""
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageDay: String
    var temperatureDay: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageDay)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperatureDay)º")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityInfoView: View {
    var cityText: String
    
    var body: some View {
        Text(cityText)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct primaryInfoView: View {
    var imageName: String
    var temperatureDay: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperatureDay)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom)
    }
}

