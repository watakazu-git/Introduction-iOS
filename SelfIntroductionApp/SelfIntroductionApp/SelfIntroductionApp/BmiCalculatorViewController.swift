//
//  BmiCalculatorViewController.swift
//  SelfIntroductionApp
//
//  Created by Watanabe Kazuyuki on 2023/05/07.
//

import UIKit

class BmiCalculatorViewController: UIViewController {
    @IBOutlet var heightTextField: UITextField! {
        didSet {
            heightTextField.placeholder = "身長をcmで入力してください。"
        }
    }
    @IBOutlet var weightTextField: UITextField! {
        didSet {
            weightTextField.placeholder = "体重をkgで入力してください。"
        }
    }
    @IBOutlet var bmiLabel: UILabel! {
        didSet {
            bmiLabel.text = "ここに計算結果が表示されます。"
            bmiLabel.textColor = UIColor.lightGray

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculationBtnAction(_ sender: Any) {
        let doubleH = Double(heightTextField.text!)
        let doubleW = Double(weightTextField.text!)
        if (doubleH == nil && doubleW == nil) {
            bmiLabel.text = "値が入力されていません。"
            bmiLabel.textColor = UIColor.red
        } else if (doubleH == nil) {
            bmiLabel.text = "身長が入力されていません。"
            bmiLabel.textColor = UIColor.red
        } else if (doubleW == nil) {
            bmiLabel.text = "体重が入力されていません。"
            bmiLabel.textColor = UIColor.red
        } else if (doubleH! < doubleW!) {
            bmiLabel.text = "不正な値です。"
            bmiLabel.textColor = UIColor.red
        } else {
            bmiLabel.text = calculation(height: doubleH!, weight: doubleW!)
            
            if (Double(calculation(height: doubleH!, weight: doubleW!)) ?? 0.0 >= 25.0) { //Nil coalescing operator
                bmiLabel.textColor = UIColor.red
            } else if (Double(calculation(height: doubleH!, weight: doubleW!)) ?? 0.0 < 18.0) {
                bmiLabel.textColor = UIColor.cyan
            } else {
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
