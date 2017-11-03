//
//  ViewController.swift
//  Bout Time Test
//
//  Created by Joel Strahan on 8/12/17.
//  Copyright © 2017 Joel Strahan. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

    
    // View Outlets
    @IBOutlet weak var AnswerOneView: UIView!
    @IBOutlet weak var AnswerTwoView: UIView!
    @IBOutlet weak var AnswerThreeView: UIView!
    @IBOutlet weak var AnswerFourView: UIView!
    
    // Label Outlets
    @IBOutlet weak var LabelA1: UILabel!
    @IBOutlet weak var LabelA2: UILabel!
    @IBOutlet weak var LabelA3: UILabel!
    @IBOutlet weak var LabelA4: UILabel!
    
    // Button and Results Lable (shakeLabel) Outlets
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var shakeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    // Arrow Button Outlets
    @IBOutlet weak var DownA1: UIButton!
    @IBOutlet weak var UpA2: UIButton!
    @IBOutlet weak var DownA2: UIButton!
    @IBOutlet weak var UpA3: UIButton!
    @IBOutlet weak var DownA3: UIButton!
    @IBOutlet weak var UpA4: UIButton!
    
    // Stored Values for Quiz
    var round = EventSet().masterQuiz(for: Era.randomEra())
    var roundAnswers = [String]()
    var roundMaster = [String]()
    
    // Stored Values for Timer
    var timer = Timer()
    var lighteningRound = Bool()
    var timeLeft = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AnswerOneView.layer.cornerRadius = 5
        AnswerTwoView.layer.cornerRadius = 5
        AnswerThreeView.layer.cornerRadius = 5
        AnswerFourView.layer.cornerRadius = 5
        
        timerLabel.alpha = 1
        Button.alpha = 0
        Button.isEnabled = false
        Button.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
        UpA2.setImage(#imageLiteral(resourceName: "up_half"), for: .normal)
        
        // Assign quiz to labels
        let testQuiz = round
        roundAnswers = testQuiz.quiz
        roundMaster = testQuiz.master
        LabelA1.text = roundAnswers[0]
        LabelA2.text = roundAnswers[1]
        LabelA3.text = roundAnswers[2]
        LabelA4.text = roundAnswers[3]
        
        // Start Timer
        runTimer()
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func DownOne(_ sender: Any) {
        DownA1.setImage(#imageLiteral(resourceName: "down_full_selected"), for: .highlighted)
        let new = rearrange(eventItem: roundAnswers, eventPosition: 0, toPosition: 1)
        roundAnswers = new
        populate(labelsWith: new)
    }
    
    
    @IBAction func UpTwo(_ sender: Any) {
        UpA2.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
        let new = rearrange(eventItem: roundAnswers, eventPosition: 1, toPosition: 0)
        roundAnswers = new
        populate(labelsWith: new)
    }
    
    @IBAction func DownTwo(_ sender: Any) {
        DownA2.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        let new = rearrange(eventItem: roundAnswers, eventPosition: 1, toPosition: 2)
        roundAnswers = new
        populate(labelsWith: new)
    }
    
    @IBAction func UpThree(_ sender: Any) {
        UpA3.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
        let new = rearrange(eventItem: roundAnswers, eventPosition: 2, toPosition: 1)
        roundAnswers = new
        populate(labelsWith: new)
    }
    
    @IBAction func DownThree(_ sender: Any) {
        DownA3.setImage(#imageLiteral(resourceName: "down_half_selected"), for: .highlighted)
        let new = rearrange(eventItem: roundAnswers, eventPosition: 2, toPosition: 3)
        roundAnswers = new
        populate(labelsWith: new)
    }
    
    @IBAction func UpFour(_ sender: Any) {
        UpA4.setImage(#imageLiteral(resourceName: "up_full_selected"), for: .highlighted)
        let new = rearrange(eventItem: roundAnswers, eventPosition: 3, toPosition: 2)
        roundAnswers = new
        populate(labelsWith: new)
    }
    
    
    
    @IBAction func buttonSwitch(_ sender: Any) {
        if Button.currentImage == #imageLiteral(resourceName: "next_round_success") {
        newQuiz()
        Button.alpha = 0
        Button.isEnabled = false
        timerLabel.alpha = 1
        } else if Button.currentImage == #imageLiteral(resourceName: "play_again") {
            timeLeft = 60
            newQuiz()
            runTimer()
            Button.alpha = 0
            Button.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
            Button.isEnabled = false
            timerLabel.alpha = 1
        }
    }
    
    // Shake functions
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if roundAnswers == roundMaster {
                shakeLabel.text = "Great Job"
                Button.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
                Button.alpha = 1
                Button.isEnabled = true
                timerLabel.alpha = 0
            } else {
                shakeLabel.text = "Keep Trying"
            }
        }
    }
    
    // HELPER METHODS
    
    
        // New Quiz
    func newQuiz() {
        round = EventSet().masterQuiz(for: Era.randomEra())
        roundMaster = round.master
        roundAnswers = round.quiz
        LabelA1.text = roundAnswers[0]
        LabelA2.text = roundAnswers[1]
        LabelA3.text = roundAnswers[2]
        LabelA4.text = roundAnswers[3]
    }
    
        // Rearange Labels
    func rearrange(eventItem: [String], eventPosition: Int, toPosition: Int) -> [String] {
        var array = eventItem
        let item = array.remove(at: eventPosition)
        array.insert(item, at: toPosition)
        
        return array
    }
    
        // Populate Labels
    func populate(labelsWith answers: [String]) {
        LabelA1.text = answers[0]
        LabelA2.text = answers[1]
        LabelA3.text = answers[2]
        LabelA4.text = answers[3]
        self.view.reloadInputViews()
    }
    
    // Timer during quiz
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        timeLeft = 60
    }
    
    // proveds string for lighteningCountdown outlet
    func updateTimer() {
        timeLeft -= 1
        let minutes = Int(timeLeft) / 60 % 60
        let seconds = Int(timeLeft) % 60
        
        if timeLeft >= 10 {
            timerLabel.text = "\(String(minutes)):\(String(seconds))"
        } else if timeLeft < 10 && timeLeft > 0 {
            timerLabel.text = "\(String(minutes)):0\(String(seconds))"
        } else if timeLeft <= 0 {
            timer.invalidate()
            timerLabel.alpha = 0
            Button.setImage(#imageLiteral(resourceName: "play_again"), for: .normal)
            Button.alpha = 1
            Button.isEnabled = true
        }
    }
    
    
    /*
    func updateTimer() {
        seconds -= 1
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
*/

}

