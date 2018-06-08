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
    
    @IBOutlet weak var show_weather: UITextView!
    var weather = Weather()
    var count: Int = 1
    var timer = Timer()
    var date: Date!
    var another_date: Date!
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        initialize()
        show_weather.text = weather.getData(index: 0)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.counter), userInfo: nil, repeats: true)
    }
    
    func initialize()
    {
        date = dateFormatter.date(from: weather.weather.list[0].date);
        another_date = dateFormatter.date(from: weather.weather.list[1].date);
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
            show_weather.text = weather.getData(index: count);
            count += 1
            if(count < weather.weather.list.count)
            {
                another_date = dateFormatter.date(from: weather.weather.list[count].date)
            }
            else{
                initialize()
                count = 1
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

