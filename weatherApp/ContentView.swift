//
//  ContentView.swift
//  weatherApp
//
//  Created by manish on 29/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = true
    var body: some View {
            ZStack {
                BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightblue"))
                VStack(){
                    CityTextView(cityName: "Prayagraj, India")
                    VStack(spacing: 8.0){
                        Image(systemName: isNight ? "cloud.rain.fill": "cloud.sun.fill")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 180, height: 180)
                        Text( isNight ? "45°" : "68°")
                            .font(.system(size: 70, weight: .medium, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 60)
                    HStack(spacing: 25.0){
                        WeatherDayView(dayofWeek: "MON", imageName: isNight ? "cloud.rain.fill" : "cloud.sun.fill", temperature: 76)
                        WeatherDayView(dayofWeek: "TUE", imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 88)
                        WeatherDayView(dayofWeek: "WED", imageName: isNight ? "moon.stars.fill" : "wind.snow", temperature: 55)
                        WeatherDayView(dayofWeek: "THU", imageName: isNight ? "cloud.bolt.rain.fill" : "snow", temperature: 45)
                        WeatherDayView(dayofWeek: "FRI", imageName: isNight ? "cloud.snow.fill" : "sunset.fill", temperature: 75)
                        
                    }
                    .padding(.bottom , 10)
                    
                    Button {
                        isNight.toggle()
                    } label: {
                        Text("Change Day Time")
                            .frame(width: 280, height: 60)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .font(.system(size: 22, weight: .bold, design: .default))
                            .cornerRadius(10.0)
                    }
                    
                    .padding(.bottom , 10)
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            ContentView()
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    var dayofWeek:String
    var imageName:String
    var temperature:Int
    var body: some View {
        VStack{
            Text(dayofWeek)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    var topColor:Color
    var bottomColor:Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName:String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
