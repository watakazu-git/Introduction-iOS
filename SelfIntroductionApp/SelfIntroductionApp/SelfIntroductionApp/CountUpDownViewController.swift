//
//  CountUpDownViewController.swift
//  SelfIntroductionApp
//
//  Created by Watanabe Kazuyuki on 2023/04/30.
//

import UIKit

class CountUpDownViewController: UIViewController {
    @IBOutlet weak var countUpDownLabel: UILabel!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func countUpButton(_ sender: Any) {
        count += 1
        countUpDownLabel.text = String(count)
        changeTextColor()
    }
    
    @IBAction func countDownButton(_ sender: Any) {
        count -= 1
        countUpDownLabel.text = String(count)
        changeTextColor()
    }
    
    func changeTextColor() {
        if count >= 10 {
            countUpDownLabel.textColor = UIColor.green
        }else if count < 0 {
            countUpDownLabel.textColor = UIColor.red
        }else {
            countUpDownLabel.textColor = UIColor.blue
        }
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
