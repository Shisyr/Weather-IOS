//
//  Weather.swift
//  Lesson01
//
//  Created by Шисыр Мухаммед Шарипович on 06.06.2018.
//  Copyright © 2018 Шисыр Мухаммед Шарипович. All rights reserved.
//
import UIKit
import SwiftyJSON

class Weather{
    var weather: Basic_info!
    struct Basic_info{
        var name_city: String!
        var id: String!
        var country: String!
        var population: String!
        var list: [List]
        init(json: JSON)
        {
            list = []
            name_city = json["city"]["name"].stringValue
            id = json["city"]["id"].stringValue
            country = json["city"]["country"].stringValue
            population = json["city"]["population"].stringValue
            for i in 0..<json["list"].count{
                let l = List(json: json["list"][i]);
                list.append(l);
            }
        }
    }
    struct List{
        var dt: String!
        var temp: Double!
        var temp_min: Double!
        var temp_max: Double!
        var pressure: String!
        var sea_level: String!
        var ground_level: String!
        var humidity: String!
        var temp_kf: String!
        var weather_id: String!
        var weather_main: String!
        var description_weather: String!
        var weather_icon: String!
        var cloud: String!
        var wind_degree: String!
        var wind_speed: String!
        var rain: String!
        var sys: String!
        var date: String!
        init(json: JSON) {
            dt = json["dt"].stringValue
            temp = json["main"]["temp"].double
            temp_min = json["main"]["temp_min"].double
            temp_max = json["main"]["temp_max"].double
            pressure = json["main"]["pressure"].stringValue
            sea_level = json["main"]["sea_level"].stringValue
            ground_level = json["main"]["grnd_level"].stringValue
            humidity = json["main"]["humidity"].stringValue
            temp_kf = json["main"]["temp_kf"].stringValue
            weather_id = json["weather"][0]["id"].stringValue
            weather_main = json["weather"][0]["main"].stringValue
            weather_icon = json["weather"][0]["icon"].stringValue
            description_weather = json["weather"]["description"].stringValue
            cloud = json["clouds"]["all"].stringValue
            wind_degree = json["wind"]["speed"].stringValue
            wind_speed = json["wind"]["deg"].stringValue
            rain = json["rain"]["3h"].stringValue
            sys = json["sys"]["pod"].stringValue
            date = json["dt_txt"].stringValue
        }
    }

    
    init()
    {
        getJSONData()
    }
    func getJSONData(){
        if let file = Bundle.main.path(forResource: "weather", ofType:"json")
        {
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: file), options: .alwaysMapped)
                let jsonObj = try JSON(data: data);
                weather = Basic_info(json: jsonObj)
            }
            catch let error{
                print("parse error: \(error.localizedDescription)")
            }
        }
        else{
            print("Invalid filename");
        }
    }
//    func setPlace_Weather()
//    {
//        info_weather = ""
//        info_weather += " Counry: " + information_weather.country
//        info_weather += "\n City: " + information_weather.name_city
//        info_weather += "\n ID: " + information_weather.id
//        info_weather += "\n Population: " + information_weather.population
//
//    }
//    func initialize()
//    {
////        if(count >= array_weather.count)
////        {
////            count = 0;
////            date = dateFormatter.date(from: array_weather[0].date);
////        }
//        setPlace_Weather()
//        info_weather += "\n Weather: " + array_weather[count].weather
//        info_weather += "\n Description of weather: " + array_weather[count].description_weather
//        info_weather += "\n Temperature: " + String(format: "%.1f", array_weather[count].temp - 273.15) + " C"
//        info_weather += "\n Maximum temperature: " + String(format: "%.1f", array_weather[count].temp_max - 273.15) + " C"
//        info_weather += "\n Minimum temperature: " + String(format: "%.1f", array_weather[count].temp_min - 273.15) + " C"
//        info_weather += "\n Ground of Level: " + String(format: "%.1f", array_weather[count].ground_level - 273.15)
//        info_weather += "\n Sea level: " + String(format: "%.1f", array_weather[count].sea_level - 273.15)
//        info_weather += "\n Info of Rain: " + array_weather[count].rain
//        info_weather += "\n Wind: {degree: " + array_weather[count].wind_degree
//        info_weather += ", speed: " + array_weather[count].wind_speed + "}\n"
////        if(count < array_weather.count)
////        {
////            count += 1
////        }
//    }
}
