//
//  BmiCalculatorViewController.swift
//  SelfIntroductionApp
//
//  Created by Watanabe Kazuyuki on 2023/05/07.
//

import UIKit

class BmiCalculatorViewController: UIViewController {
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var bmiLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.placeholder = "身長をcmで入力してください。"
        weightTextField.placeholder = "体重をkgで入力してください。"
        bmiLabel.text = "ここに計算結果が表示されます。"
        bmiLabel.textColor = UIColor.lightGray
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculationBtnAction(_ sender: Any) {
        let doubleH = Double(heightTextField.text!)
        let doubleW = Double(weightTextField.text!)
        if (doubleH == nil && doubleW == nil) {
            bmiLabel.text = "値が入力されていません。"
            bmiLabel.textColor = UIColor.red
        }else if (doubleH == nil) {
            bmiLabel.text = "身長が入力されていません。"
            bmiLabel.textColor = UIColor.red
        }else if (doubleW == nil) {
            bmiLabel.text = "体重が入力されていません。"
            bmiLabel.textColor = UIColor.red
        }else {
            bmiLabel.text = calculation(height: doubleH!, weight: doubleW!)
            
            if (Float(calculation(height: doubleH!, weight: doubleW!)) ?? 0.0 >= 25.0) {
                bmiLabel.textColor = UIColor.red
            }else if (Float(calculation(height: doubleH!, weight: doubleW!)) ?? 0.0 < 18.0) {
                bmiLabel.textColor = UIColor.cyan
            }else {
                bmiLabel.textColor = UIColor.green
            }
        }
    }
    
    
    
    func calculation(height: Double, weight: Double) -> String {
        let h = height / 100
        let w = weight
        var result = w / (h * h)
        result = floor(result * 10) / 10
        
        return result.description
    }
}
