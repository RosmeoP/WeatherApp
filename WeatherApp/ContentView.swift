//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mauricio Parada on 14/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, Color("LightBlue")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Text("Cupertino, El Salvador")
                    .font(.system(size:32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8){
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: (.fit))
                        .frame(width: 180, height: 180)
                    Text("76º")
                        .font(.system(size:70, weight: .medium))
                        .foregroundColor(.white)

                }
                Spacer()
                
                HStack(spacing:18){
                    WeatherDayView(dayOfWeek: "TUE",                                        imageDay: "cloud.sun.fill",                                 temperatureDay: 72)
                    WeatherDayView(dayOfWeek: "WEN",                                        imageDay: "cloud.sun.fill",                                 temperatureDay: 74)
                    WeatherDayView(dayOfWeek: "THU",                                        imageDay: "sun.max.fill",                                   temperatureDay: 74)
                    WeatherDayView(dayOfWeek: "FRI",                                        imageDay: "sun.max.fill",                                   temperatureDay: 72)
                    WeatherDayView(dayOfWeek: "SAT",                                        imageDay: "cloud.sun.fill",                                  temperatureDay: 74)
                }
            

                    Spacer()
                
                
                
            }
            
        
        }
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
        VStack{
            Text(dayOfWeek)
                .font(.system(size:16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageDay )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: (.fit))
                .frame(width: 40, height: 40)
            Text("\(temperatureDay)º")
                .font(.system(size:28, weight: .medium))
                .foregroundColor(.white)
            
            
            
        }
    }
}
