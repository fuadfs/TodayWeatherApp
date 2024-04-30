//
//  WeatherView.swift
//  TodayWeatherApp
//
//  Created by Fuad Fadlila Surenggana on 30/04/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
            VStack(content: {
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(weather.name)
                        .bold().font(.title)
                    
                    Text("Today,\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://i.ytimg.com/vi/JID7QFLbQRI/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AHUBoAC4AOKAgwIABABGDQgTyhyMA8=&rs=AOn4CLDQ9Ry5jzAkXd8G0_2s9NyMicWQnQ")) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            })
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Weather Now")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer", name: "Max Temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.706, saturation: 0.769, brightness: 0.371))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        })
        .ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        .background(Color(hue: 0.706, saturation: 0.769, brightness: 0.371))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
