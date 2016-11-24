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

    var currentValue: Int = 0;
    var targetValue: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentValue = 50
        targetValue = 1 + Int(arc4random_uniform(100))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        scoreLabel.text = String(targetValue)
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue) The random number is \(targetValue)"
        let alert = UIAlertController(title: "Slider Value", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesom", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value)
    }
    
    @IBAction func showAbout() {
        
    }
    
    @IBAction func startOver() {
        
    }


}

