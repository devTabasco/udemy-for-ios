//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var chooseSplit: UILabel!
    
    var totalBill: Float?
    var tip: Float?
    var splitNum: Float?
    var calculateTotal: Float?
    
    @IBAction func twentyActionButton(_ sender: UIButton) {
        twentyPctButton.isSelected = true
        twentyPctButton.setTitleColor(.white, for: .selected)
        tenPctButton.isSelected = false
        tenPctButton.setTitleColor(.green, for: .selected)
        zeroPctButton.isSelected = false
        zeroPctButton.setTitleColor(.green, for: .selected)
    }
    
    @IBAction func tenActionButton(_ sender: UIButton) {
        twentyPctButton.isSelected = false
        twentyPctButton.setTitleColor(.green, for: .selected)
        tenPctButton.isSelected = true
        tenPctButton.setTitleColor(.white, for: .selected)
        zeroPctButton.isSelected = false
        zeroPctButton.setTitleColor(.green, for: .selected)
    }
    
    @IBAction func zeroActionButton(_ sender: UIButton) {
        twentyPctButton.isSelected = false
        twentyPctButton.setTitleColor(.green, for: .selected)
        tenPctButton.isSelected = false
        tenPctButton.setTitleColor(.green, for: .selected)
        zeroPctButton.isSelected = true
        zeroPctButton.setTitleColor(.white, for: .selected)
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        totalBill = Float(billText.text ?? "0.0")
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        chooseSplit.text = String(format: "%.0f", sender.value)
        splitNum = Float(chooseSplit.text ?? "0")
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if(twentyPctButton.isSelected){
            tip = 0.2
        }
        else if(tenPctButton.isSelected){
            tip = 0.1
        }else{
            tip = 0
        }
        
        calculateTotal = ((totalBill ?? 0.0)*(1+(tip ?? 0.0))/(splitNum ?? 0.0 ))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        //print(calculateTotal!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //identifier를 이용해 view들을 선택해줄 수 있음
        if segue.identifier == "goToResult"{
            //as!를 이용해 destination 중 어떤 view를 선택하는지 고를 수 있음 -> downCasting해주는 것임
            
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.total = String(format: "%.2f", calculateTotal as! CVarArg)
            destinationVC.settingText = "Split between \(Int(splitNum!)) people, with \(Int(tip!*100))% tip."
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

