//
//  TimerViewController.swift
//  SelfIntroductionApp
//
//  Created by Watanabe Kazuyuki on 2023/05/01.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    var elapsedTime: Float = 0.0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() { //実行中のアプリがメモリを使いすぎた時に呼び出される。
        super.didReceiveMemoryWarning()       //アプリのクラッシュを未然に防ぐ
    }
    
    @IBAction func tappedStartButton(_ sender: UIButton) {
        timer?.invalidate() //タイマーを破棄
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            self.elapsedTime += 0.01
            let milliSecond = Int(self.elapsedTime * 100) % 100
            let second = Int(self.elapsedTime) % 60
            let minutes = Int(self.elapsedTime / 60)
            self.timerLabel.text = String(format: "%02d:%02d:%02d", minutes, second, milliSecond)
        }
    }
    
    @IBAction func tappedStop(_ sender: Any) {
        if let t = timer {
            t.invalidate()
        }
        timer?.invalidate()
    }
    
    @IBAction func tappedReset(_ sender: Any) {
        elapsedTime = 0.0
        
        let milliSecond = Int(self.elapsedTime * 100) % 100
        let second = Int(self.elapsedTime) % 60
        let minutes = Int(self.elapsedTime / 60)
        self.timerLabel.text = String(format: "%02d:%02d:%02d", minutes, second, milliSecond)
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
