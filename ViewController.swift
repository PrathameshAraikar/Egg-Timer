//
//  ViewController.swift
//  EggTimer
//
//  Created by Prathamesh Araikar on 21/07/2021. Completed on 30/07/2021
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    
    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        secondsPassed = 0
        progressBar.progress = 0.0
        titleLabel.text = hardness

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed <= totalTime {
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            secondsPassed += 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
    

