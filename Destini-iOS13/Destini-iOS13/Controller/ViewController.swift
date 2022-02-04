//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
//    var storyText = "You see a fork in the road."
//    var choice1 = "Take a left"
//    var choice2 = "Take a right"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    @IBAction func choiceMode(_ sender: UIButton) {
        let destTitle = sender.currentTitle
        print(destTitle!)
        storyBrain.checkDestination(destTitle)
        //storyBrain.nextStory()
        
        updateUI()
    }
    
    func updateUI(){
        storyLabel.text = storyBrain.getStoryText()
        self.choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        self.choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }

}

