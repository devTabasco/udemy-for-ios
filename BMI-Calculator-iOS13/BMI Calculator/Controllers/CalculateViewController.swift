//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmiValue: String?
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let currentValue = Double(sender.value)
        let rounded = Double(round(100*currentValue)/100)
        height.text = "\(rounded)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
//        var rounded = Double(round(100*currentValue)/100)
        weight.text = "\(currentValue)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        //var bmi = String(format: "%.2f", weight/(height*height))
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
//        let resultViewConteroller = ResultViewController()
//        //self.present(resultViewConteroller, animated: true, completion: nil)
//        resultViewConteroller.bmiValue = bmi
//
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    
    //segue : 앱뷰를 연결시켜주는 역할
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //identifier를 이용해 view들을 선택해줄 수 있음
        if segue.identifier == "goToResult"{
            //as!를 이용해 destination 중 어떤 view를 선택하는지 고를 수 있음 -> downCasting해주는 것임
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}

