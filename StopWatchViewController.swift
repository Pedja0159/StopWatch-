//
//  StopWatchViewController.swift
//  StopWatch
//
//  Created by Pejo on 26/02/2020.
//  Copyright © 2020 pejo015. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {
    
    var timer = Timer()
    var isTimeRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        timerLabel.layer.cornerRadius = 5.0
        timerLabel.layer.masksToBounds = true
        
        
        resetButton.layer.cornerRadius = 4.0
        resetButton.layer.masksToBounds = true
        resetButton.isEnabled = false
        resetButton.alpha = 0.5
        
        startButton.layer.cornerRadius = startButton.bounds.width / 2.0
        startButton.layer.masksToBounds = true
        
        pauseButton.layer.cornerRadius = pauseButton.bounds.width / 2.0
        pauseButton.layer.masksToBounds = true
        pauseButton.isEnabled = false
        pauseButton.alpha = 0.5
        
    }
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    
    
    
    @IBAction func resetDidTap(_ sender: Any) {
        
        timer.invalidate()
        isTimeRunning = false
        counter = 0.0
        
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        
        
        resetButton.alpha = 0.5
        startButton.alpha = 1.0
        pauseButton.alpha = 0.5
    }
    
    
    @IBAction func startDidTap(_ sender: Any) {
        if !isTimeRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            
            isTimeRunning = true
            
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            startButton.isEnabled = false
            
            resetButton.alpha = 1.0
            startButton.alpha = 0.5
            pauseButton.alpha = 1.0
        }
        
    }
    
    
    @IBAction func pauseDIdTap(_ sender: Any) {
        resetButton.isEnabled = true
        pauseButton.isEnabled = false
        startButton.isEnabled = true
        
        
        resetButton.alpha = 1.0
        startButton.alpha = 1.0
        pauseButton.alpha = 0.5
        
        isTimeRunning = false
        timer.invalidate()
    }
    
    
    @objc func runTimer () {
        counter += 0.1
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter / 3600
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondSting = "\(second)"
        if second < 10 {
            secondSting = "0\(second)"
        }
        let decisecond = String(format:"%.1f",counter).components(separatedBy: ".").last!
        timerLabel.text = "\(hour):\(minuteString):\(secondSting).\(decisecond)"
        
    }
    
}
