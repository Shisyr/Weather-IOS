//
//  ViewController.swift
//  Lesson01
//
//  Created by Шисыр Мухаммед Шарипович on 18.05.2018.
//  Copyright © 2018 Шисыр Мухаммед Шарипович. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var array_weather: [Weather] = [];
    let information_weather = Infoweather();
    var info_weather: String = ""
    var count = 0
    var timer = Timer()
    var date: Date!
    var another_date: Date!
    let dateFormatter = DateFormatter()
    @IBOutlet weak var show_weather_text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSONData()
        initialize()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        date = dateFormatter.date(from: array_weather[0].date);
        another_date = dateFormatter.date(from: array_weather[1].date);
        show_weather_text.text = info_weather
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    func setPlace_Weather()
    {
        info_weather = ""
        info_weather += " Counry: " + information_weather.country
        info_weather += "\n City: " + information_weather.name_city
        info_weather += "\n ID: " + information_weather.id
        info_weather += "\n Population: " + information_weather.population
        
    }
    func initialize()
    {
        if(count >= array_weather.count)
        {
            count = 0;
            date = dateFormatter.date(from: array_weather[0].date);
        }
        setPlace_Weather()
        info_weather += "\n Weather: " + array_weather[count].weather
        info_weather += "\n Description of weather: " + array_weather[count].description_weather
        info_weather += "\n Temperature: " + String(format: "%.1f", array_weather[count].temp - 273.15) + " C"
        info_weather += "\n Maximum temperature: " + String(format: "%.1f", array_weather[count].temp_max - 273.15) + " C"
        info_weather += "\n Minimum temperature: " + String(format: "%.1f", array_weather[count].temp_min - 273.15) + " C"
        info_weather += "\n Ground of Level: " + String(format: "%.1f", array_weather[count].ground_level - 273.15)
        info_weather += "\n Sea level: " + String(format: "%.1f", array_weather[count].sea_level - 273.15)
        info_weather += "\n Info of Rain: " + array_weather[count].rain
        info_weather += "\n Wind: {degree: " + array_weather[count].wind_degree
        info_weather += ", speed: " + array_weather[count].wind_speed + "}\n"
        if(count < array_weather.count)
        {
          count += 1
        }
    }
    @objc
    func counter()
    {
        date.addTimeInterval(3600 * 3); // just need to change from 3600 * 3 to 1. I put 3600 * 3 in order to check that it works no problem.
        print(dateFormatter.string(from: date))
        print(date.timeIntervalSince(another_date))
        print(dateFormatter.string(from: another_date))
        if(date.timeIntervalSince(another_date) >= 0.0)
        {
            date = another_date;
            initialize()
            if(count < array_weather.count)
            {
                another_date = dateFormatter.date(from: array_weather[count].date)
            }
            show_weather_text.text = info_weather
        }
        
    }

    
    
    func getJSONData(){
        if let file = Bundle.main.path(forResource: "weather", ofType:"json")
        {
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: file), options: .alwaysMapped)
                let jsonObj = try JSON(data: data);
                information_weather.name_city = jsonObj["city"]["name"].stringValue
                information_weather.id = jsonObj["city"]["id"].stringValue
                information_weather.population = jsonObj["city"]["population"].stringValue
                information_weather.country = jsonObj["city"]["country"].stringValue
                for i in 0..<jsonObj["list"].count{
                    let weather = Weather();
                    
                    weather.temp = jsonObj["list"][i]["main"]["temp"].double
                    weather.cloud = jsonObj["list"][i]["clouds"]["all"].stringValue
                    weather.temp_min = jsonObj["list"][i]["main"]["temp_min"].double
                    weather.temp_max = jsonObj["list"][i]["main"]["temp_max"].double
                    weather.ground_level = jsonObj["list"][i]["main"]["grnd_level"].double
                    
                    weather.sea_level = jsonObj["list"][i]["main"]["sea_level"].double;
                    
                   
                    weather.weather = jsonObj["list"][i]["weather"][0]["main"].stringValue;
                    
                    weather.description_weather = jsonObj["list"][i]["weather"][0]["description"].stringValue
                    
                    weather.rain = jsonObj["list"][i]["rain"]["3h"].stringValue
                   
                    weather.wind_speed = jsonObj["list"][i]["wind"]["speed"].stringValue
                    
                    weather.wind_degree = jsonObj["list"][i]["wind"]["deg"].stringValue
                    
                    weather.date = jsonObj["list"][i]["dt_txt"].stringValue
                    
                    array_weather.append(weather);
                }
            }
            catch let error{
                print("parse error: \(error.localizedDescription)")
            }
        }
        else{
            print("Invalid filename");
        }
       // let path = NSBundle.mainBundle().pathForResource("weather", ofType: "json")
       // let data = NSData(contentsOf: file) as NSData!
      
//        let clearJSON = JSON(data: data, options: NSJSONReadingOptions.MutableContainers, error: nil);
//        print(clearJSON);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

