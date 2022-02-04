//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //contal로 element 가져오기
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    var leftDiceNumber = 0
    var rightDiceNumber = 0
    
    var diceArray = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
    
    //var는 변수, let은 선언
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //WHO         .What  = Value
        //diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
        //diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        leftDiceNumber = Int.random(in: 0...5)
        rightDiceNumber = Int.random(in: 0...5)
        
        
        //diceArray.randomElement() <- 이렇게도 가능
        diceImageView1.image = diceArray[leftDiceNumber]
        diceImageView2.image = diceArray[rightDiceNumber]
        
        //leftDiceNumber = leftDiceNumber + 1
        //rightDiceNumber = rightDiceNumber - 1
        
        //diceImageView1.image = UIImage(named: "DiceFour")
        //diceImageView2.image = UIImage(named: "DiceFour")
        
    }
    
    
    
}

