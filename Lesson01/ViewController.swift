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
    var count = 0
    var timer = Timer()
    var date: Date!
    var another_date: Date!
    let dateFormatter = DateFormatter()
    @IBOutlet weak var show_weather_text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello1111")
        var l = Weather()
//        getJSONData()
//        initialize()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        date = dateFormatter.date(from: array_weather[0].date);
//        another_date = dateFormatter.date(from: array_weather[1].date);
//        show_weather_text.text = info_weather
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    
//    @objc
//    func counter()
//    {
//        date.addTimeInterval(3600 * 3); // just need to change from 3600 * 3 to 1. I put 3600 * 3 in order to check that it works no problem.
//        print(dateFormatter.string(from: date))
//        print(date.timeIntervalSince(another_date))
//        print(dateFormatter.string(from: another_date))
//        if(date.timeIntervalSince(another_date) >= 0.0)
//        {
//            date = another_date;
//            initialize()
//            if(count < array_weather.count)
//            {
//                another_date = dateFormatter.date(from: array_weather[count].date)
//            }
//            show_weather_text.text = info_weather
//        }
//
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

