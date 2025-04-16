//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mauricio Parada on 14/4/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
               CityInfoView(cityText: "Cupertino, Jucuapa")
                primaryInfoView(imageName: isNight ? "moon.stars.fill" :                     "cloud.sun.fill",
                    temperatureDay: isNight ? 65 : 72)
                    
                    
                

                
                
                HStack(spacing:18){
                    WeatherDayView(dayOfWeek: "TUE",                  imageDay: isNight ?                   "moon.fill" :                 "cloud.sun.fill",                             temperatureDay: 72)
                    WeatherDayView(dayOfWeek: "WEN",                 imageDay: isNight ?                           "cloud.moon.fill" :                           "cloud.sun.fill",                             temperatureDay: isNight ? 71 : 73)

                    WeatherDayView(dayOfWeek: "THU", 
                        imageDay: isNight ?
                        "cloud.moon.bolt.fill"  :
                        "sun.max.fill",
                        temperatureDay: isNight ? 70 : 74)
                    WeatherDayView(dayOfWeek: "FRI",
                        imageDay:isNight ?
                        "moon.stars.fill" :
                        "sun.max.fill",
                        temperatureDay: isNight ? 71 : 74)
                    WeatherDayView(dayOfWeek: "SAT",                  imageDay: isNight ?
                        "moon.stars.fill" :
                        "cloud.sun.fill",
                        temperatureDay: isNight ? 72 : 69)
                }
            

                    Spacer()
                
                Button{
                    isNight.toggle()
                }label:{
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
   @Binding var isNight: Bool
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlue")]),
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

