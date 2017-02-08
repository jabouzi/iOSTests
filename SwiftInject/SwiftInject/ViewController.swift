//
//  ViewController.swift
//  SwiftInject
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import UIKit
import Swinject

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let container = Container()
        container.register(Animal.self) { _ in Cat(name: "Mimi") }
        container.register(Person.self) { r in PetOwner(pet: r.resolve(Animal.self)!) }
        
        let person = container.resolve(Person.self)!
        person.play() // prints "I'm playing with Mimi."
        
        container.register(pConnect.self) { _ in Connect() }
        let connect = container.resolve(pConnect.self)!
        connect.connect(url: "test", port: "test", nameSpace: "test")
        
        container.register(pSocket.self) {r in Socket(connect: connect as! Connect, url: "testz", port: "testz", nameSpace: "testz")}
        let socket = container.resolve(pSocket.self)!
        socket._connect()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

