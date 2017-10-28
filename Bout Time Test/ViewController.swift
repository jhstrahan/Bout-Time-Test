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
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var shakeLabel: UILabel!
    
    @IBOutlet weak var UpA2: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AnswerOneView.layer.cornerRadius = 5
        AnswerTwoView.layer.cornerRadius = 5
        AnswerThreeView.layer.cornerRadius = 5
        AnswerFourView.layer.cornerRadius = 5
        
        Button.setImage(#imageLiteral(resourceName: "next_round_success"), for: .normal)
        UpA2.setImage(#imageLiteral(resourceName: "up_half"), for: .normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func UpTwo(_ sender: Any) {
        UpA2.setImage(#imageLiteral(resourceName: "up_half_selected"), for: .highlighted)
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


}

