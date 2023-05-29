//
//  QuizJsonViewController.swift
//  SelfIntroductionApp
//
//  Created by Watanabe Kazuyuki on 2023/05/09.
//

import UIKit

class QuizJsonViewController: UIViewController {
    
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var aswerButton: [UIButton]!
    
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    
    struct Content : Codable {
        
        struct Lvl1 : Codable{
            var question : String
            var correct : Int
            var answer1 : String
            var answer2 : String
            var answer3 : String
            var answer4 : String
        }
        
        struct Lvl2 : Codable {
            var question : String
            var correct : Int
            var answer1 : String
            var answer2 : String
            var answer3 : String
            var answer4 : String
        }
        
        struct Lvl3 : Codable {
            var question : String
            var correct : Int
            var answer1 : String
            var answer2 : String
            var answer3 : String
            var answer4 : String
        }
        
        var lvl1 : Lvl1
        var lvl2 : Lvl2
        var lvl3 : Lvl3
    }
    var quizContents = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
        quizNumberLabel.text = quizContents[0].lvl2.answer2
        
        quizNumberLabel.text = "第\(quizCount + 1)問"
        //quizTextView.text = quizContents[0].lvl1
        //answerButton1.setTitle(quizArray[2], for: .normal)
        //answerButton2.setTitle(quizArray[3], for: .normal)
        //answerButton3.setTitle(quizArray[4], for: .normal)
        //answerButton4.setTitle(quizArray[5], for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAction(sender: UIButton) {
        print(sender.tag)
    }
    
    
    private func loadJson(){
        // パスの取得
        
        guard let url = Bundle.main.url(forResource: "quiz", withExtension: "json") else { return }
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        self.quizContents = try! JSONDecoder().decode([Content].self, from: data)
        
        print("aaa \(quizContents.count)")
        
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

