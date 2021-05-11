//
//  ViewController.swift
//  countdown
//
//  Created by 羅承志 on 2021/5/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var setDateLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //開始日期
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        let dateString = "2021/06/05 06:00"
        let date = dateFormatter.date(from: dateString)
        setDateLabel.text = dateString

        //今天日期
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let todaydateString = formatter.string(from: now)
        todayLabel.text = todaydateString
        
        //倒數
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            (_)in
            let interval = Int(date!.timeIntervalSinceNow)
            let seconds = interval % 60
            let minutes = interval/60 % 60
            let hours = interval/60/60 % 24
            let days = interval/60/60/24
            
            //倒數數字放入label
            self.daysLabel.text = "\(days)"
            self.hoursLabel.text = "\(hours)"
            self.minutesLabel.text = "\(minutes)"
            self.secondsLabel.text = "\(seconds)"
        }        
    }
}

