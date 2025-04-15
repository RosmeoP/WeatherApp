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
            BackgroundView(topColor: .blue, bottomColor:Color("LightBlue"))
            VStack{
               CityInfoView(cityText: "Cupertino, Jucuapa")
                primaryInfoView(imageName: "cloud.sun.fill", temperatureDay: 72)
                
                
                HStack(spacing:18){
                    WeatherDayView(dayOfWeek: "TUE",                                        imageDay: "cloud.sun.fill",                                 temperatureDay: 72)
                    WeatherDayView(dayOfWeek: "WEN",                                        imageDay: "cloud.sun.fill",                                 temperatureDay: 74)
                    WeatherDayView(dayOfWeek: "THU",                                        imageDay: "sun.max.fill",                                   temperatureDay: 74)
                    WeatherDayView(dayOfWeek: "FRI",                                        imageDay: "sun.max.fill",                                   temperatureDay: 72)
                    WeatherDayView(dayOfWeek: "SAT",                                        imageDay: "cloud.sun.fill",                                  temperatureDay: 74)
                }
            

                    Spacer()
                
                Button{
                    print("tapped...")
                }label: {
                   WeatherButton(title: "Change Day Time",
                                 backgrounColor: .white,
                                 textColor: .gray)
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

struct  BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityInfoView: View {
    
    var cityText: String
    
    var body: some View {
        Text(cityText)
            .font(.system(size:32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct primaryInfoView: View {
    
    
    var imageName: String
    var temperatureDay: Int
    
    
    var body: some View {
        
        
        

        
        VStack(spacing: 8){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: (.fit))
                .frame(width: 180, height: 180)
            Text("\(temperatureDay)º")
                .font(.system(size:70, weight: .medium))
                .foregroundColor(.white)
            
        }
        .padding(.bottom )
    }
}

