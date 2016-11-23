//
//  ViewController.swift
//  BullsEye
//
//  Created by dev on 11/21/16.
//  Copyright © 2016 Skander Jabouzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 50;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)"
        let alert = UIAlertController(title: "Slider Value", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesom", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value)
    }


}

