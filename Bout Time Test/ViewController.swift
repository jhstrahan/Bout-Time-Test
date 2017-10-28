//
//  ViewController.swift
//  Bout Time Test
//
//  Created by Joel Strahan on 8/12/17.
//  Copyright © 2017 Joel Strahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var AnswerOneView: UIView!
    @IBOutlet weak var AnswerTwoView: UIView!
    @IBOutlet weak var AnswerThreeView: UIView!
    @IBOutlet weak var AnswerFourView: UIView!
    
    @IBOutlet weak var LabelA1: UILabel!
    @IBOutlet weak var LabelA2: UILabel!
    @IBOutlet weak var LabelA3: UILabel!
    @IBOutlet weak var LabelA4: UILabel!
    
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var shakeLabel: UILabel!
    
    
    @IBOutlet weak var DownA1: UIButton!
    @IBOutlet weak var UpA2: UIButton!
    @IBOutlet weak var DownA2: UIButton!
    @IBOutlet weak var UpA3: UIButton!
    @IBOutlet weak var DownA3: UIButton!
    @IBOutlet weak var UpA4: UIButton!
    
    // Creat New Quiz
    var roundOne = EventSet().masterQuiz(for: .creation)
    var roundOneAnswers = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AnswerOneView.layer.cornerRadius = 5
        AnswerTwoView.layer.cornerRadius = 5
        AnswerThreeView.layer.cornerRadius = 5
        AnswerFourView.layer.cornerRadius = 5
        
        Button.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
        UpA2.setImage(#imageLiteral(resourceName: "up_half"), for: .normal)
        
        // Assign quiz to labels
        let testQuiz = roundOne
        roundOneAnswers = testQuiz.1
        LabelA1.text = roundOneAnswers[0]
        LabelA2.text = roundOneAnswers[1]
        LabelA3.text = roundOneAnswers[2]
        LabelA4.text = roundOneAnswers[3]
        
    }
    /*
    override func viewDidAppear(_ animated: Bool) {
        let testQuiz = roundOne
        roundOneAnswers = testQuiz.1
        LabelA1.text = roundOneAnswers[0]
        LabelA2.text = roundOneAnswers[1]
        LabelA3.text = roundOneAnswers[2]
        LabelA4.text = roundOneAnswers[3]
    }
*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func DownOne(_ sender: Any) {
        DownA1.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .highlighted)
        var new = rearrange(eventItem: roundOneAnswers, eventPosition: 0, toPosition: 1)
        roundOneAnswers = new
        LabelA1.text = new[0]
        LabelA2.text = new[1]
        LabelA3.text = new[2]
        LabelA4.text = new[3]
        self.view.reloadInputViews()
    }
    
    
    @IBAction func UpTwo(_ sender: Any) {
        UpA2.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
        var new = rearrange(eventItem: roundOneAnswers, eventPosition: 1, toPosition: 0)
        roundOneAnswers = new
        LabelA1.text = new[0]
        LabelA2.text = new[1]
        LabelA3.text = new[2]
        LabelA4.text = new[3]
        self.view.reloadInputViews()
    }
    
    @IBAction func DownTwo(_ sender: Any) {
        DownA2.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        var new = rearrange(eventItem: roundOneAnswers, eventPosition: 1, toPosition: 2)
        roundOneAnswers = new
        LabelA1.text = new[0]
        LabelA2.text = new[1]
        LabelA3.text = new[2]
        LabelA4.text = new[3]
        self.view.reloadInputViews()
    }
    
    @IBAction func UpThree(_ sender: Any) {
        UpA3.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
        var new = rearrange(eventItem: roundOneAnswers, eventPosition: 2, toPosition: 1)
        roundOneAnswers = new
        LabelA1.text = new[0]
        LabelA2.text = new[1]
        LabelA3.text = new[2]
        LabelA4.text = new[3]
        self.view.reloadInputViews()
    }
    
    @IBAction func DownThree(_ sender: Any) {
        DownA3.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        var new = rearrange(eventItem: roundOneAnswers, eventPosition: 2, toPosition: 3)
        roundOneAnswers = new
        LabelA1.text = new[0]
        LabelA2.text = new[1]
        LabelA3.text = new[2]
        LabelA4.text = new[3]
        self.view.reloadInputViews()
    }
    
    @IBAction func UpFour(_ sender: Any) {
        UpA4.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .highlighted)
        var new = rearrange(eventItem: roundOneAnswers, eventPosition: 3, toPosition: 2)
        roundOneAnswers = new
        LabelA1.text = new[0]
        LabelA2.text = new[1]
        LabelA3.text = new[2]
        LabelA4.text = new[3]
        self.view.reloadInputViews()
    }
    
    
    
    @IBAction func buttonSwitch(_ sender: Any) {
        Button.setImage(#imageLiteral(resourceName: "play_again"), for: .normal)
        
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            shakeLabel.text = "Shaken, not stirred"
        }
    }
    
    // Helper Methods
    
        // Create New Quiz with Master, Answers
    /*
    func newQuiz(for events: EventSet) -> ([String], [String]) {
        let quiz = events
        let quizMaster = quiz.master
        let quizAnswers = quiz.quiz
        
        return (quizMaster, quizAnswers)
    }
    */
        // Rearange Labels
    func rearrange(eventItem: [String], eventPosition: Int, toPosition: Int) -> [String] {
        var array = eventItem
        let item = array.remove(at: eventPosition)
        array.insert(item, at: toPosition)
        
        return array
    }


}

