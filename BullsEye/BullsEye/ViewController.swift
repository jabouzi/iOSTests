//
//  ViewController.swift
//  BullsEye
//
//  Created by dev on 11/21/16.
//  Copyright © 2016 Skander Jabouzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello World", message: "This is my first app!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesom", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }


}

