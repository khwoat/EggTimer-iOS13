//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerBar: UIProgressView!
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var timer = Timer()
    
    func countDown(time: Int) {
        let newTimes = time * 60
        var currentSeconds = time * 60
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if currentSeconds <= 0 {
                self.titleLabel.text = "Done."
                self.timerBar.progress = 1.0
                timer.invalidate()
            } else {
                self.timerBar.progress = Float(newTimes - currentSeconds) / Float(newTimes)
                currentSeconds -= 1
            }
        }
    }
   
    @IBAction func hardnessSeletion(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        print(hardness)
            
        timer.invalidate()
        countDown(time: eggTimes[hardness] ?? 0)
        
        

    }
}
