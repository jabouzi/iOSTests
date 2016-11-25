//
//  ViewController.swift
//  BullsEye
//
//  Created by dev on 11/21/16.
//  Copyright © 2016 Skander Jabouzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderBar: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!

    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    var message: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        sliderBar.value = Float(currentValue)
    }
    
    func updateLabels() {
        
        scoreLabel.text = String(targetValue)
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func getScore() {
        
        message = ""
        let hit: Int = abs(currentValue - targetValue)
        score += 100 - hit
        round += 1
        
        if hit == 0 {
            message = "Perfet!!"
        }
        else if hit <= 5 {
            message = "Almost have it"
        }
        else if hit <= 20 && hit > 5 {
            message = "Not that far"
        }
        else if hit <= 50 && hit > 20 {
            message = "Little bit far"
        }
        else {
            message = "Missed it!"
        }
    }
    
    @IBAction func showAlert() {
        getScore()
        message += " You hit \(currentValue) and Your score is \(score)"
        let alert = UIAlertController(title: "Slider Value", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in self.startNewRound(); self.updateLabels()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value)
    }
    
    @IBAction func showAbout() {
        
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        currentValue = 50
        sliderBar.value = Float(currentValue)
        updateLabels()
    }


}

