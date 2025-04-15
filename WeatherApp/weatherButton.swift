//
//  weatherButton.swift
//  WeatherApp
//
//  Created by Mauricio Parada on 15/4/25.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var backgrounColor: Color
    var textColor: Color
    
    
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgrounColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

