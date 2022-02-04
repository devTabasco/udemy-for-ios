//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        let seconds = 0.2
        print("Start")
        playSound(soundName: sender.currentTitle!)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            sender.alpha = 0.5
            print("End")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            sender.alpha = 1.0
        }
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
