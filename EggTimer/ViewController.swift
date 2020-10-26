//
//  ViewController.swift
//  EggTimer
//
//  Created by MAC on 11/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    @IBOutlet weak var remainingTimeLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    let eggTimes = ["Soft":3 , "Medium":6 , "Hard":9]
    var secondReamaining = 60
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        remainingTimeLabel.text = "Select One Egg To Boil"
    }

    @IBAction func buttonPressed(_ sender: UIButton)
    {
        let hardness = sender.currentTitle!
        secondReamaining = eggTimes[hardness]!
    
        Timer.scheduledTimer(timeInterval: 1.0, target: self , selector:(#selector(updateTime)), userInfo: nil, repeats: true)
    }
    @IBAction func okButtonPresed(_ sender: UIButton) {
        okButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        //player.stop()
    }
    
    var timer = Timer()
    @objc func updateTime() {
        if secondReamaining > 0
        {
            remainingTimeLabel.text = "\(secondReamaining) Seconds"
            secondReamaining -= 1 
        } 
        else
        {
            timer.invalidate()
            remainingTimeLabel.text = "Egg Boiled 👍"
            okButton.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            func playSound()
            {
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self , selector:(#selector(self)), userInfo: nil, repeats: false)
            }
            playSound()
        }
    }
}

