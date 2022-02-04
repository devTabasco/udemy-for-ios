//
//  ResultViewController.swift
//  Tipsy
//
//  Created by 임창용 on 2022/01/25.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var total: String?
    var settingText: String?
    var color: UIColor?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingsLable.text = settingText

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        //segue로 띄워준 창 다시 닫기
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
