//
//  ViewController.swift
//  DepenencyInjection
//
//  Created by dev on 2/7/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import UIKit
import Swinject

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //// 1
        
        let petOwner0 = PetOwner0()
        print(petOwner0.play());
        
        //// 2
        
        let catOwner1 = PetOwner1(pet: Cat1(name: "Mimi"))
        print(catOwner1.play()) // prints "I'm playing with Mimi. Meow!"
        
        let dogOwner1 = PetOwner1(pet: Dog1(name: "Hachi"))
        print(dogOwner1.play()) // prints "I'm playing with Hachi. Bow wow!"
        
        //// 3
        
        let container = Container()
        container.register(AnimalType.self) { r in Cat(name: "Mimi") }
        container.register(PetOwner.self) { r in
            PetOwner(pet: r.resolve(AnimalType.self)!)
        }
        
        let petOwner = container.resolve(PetOwner.self)!
        print(petOwner.play()) // prints "I'm playing with Mimi. Meow!"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//// 1 OO method

class Cat0 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sound() -> String {
        return "Meow!"
    }
}

class PetOwner0 {
    let pet = Cat0(name: "Mimi")
    
    func play() -> String {
        return "I'm playing with \(pet.name). \(pet.sound())"
    }
}

////// 2 POP method

protocol AnimalType1 {
    var name: String { get }
    func sound() -> String
}

class Cat1: AnimalType1 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sound() -> String {
        return "Meow!"
    }
}

class PetOwner1 {
    let pet: AnimalType1
    
    init(pet: AnimalType1) {
        self.pet = pet
    }
    
    func play() -> String {
        return "I'm playing with \(pet.name). \(pet.sound())"
    }
}

class Dog1: AnimalType1 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sound() -> String {
        return "Bow wow!"
    }
}

//// 3 Swinject

protocol AnimalType {
    var name: String { get }
    func sound() -> String
}

class Cat: AnimalType {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sound() -> String {
        return "Meow!"
    }
}

class PetOwner {
    let pet: AnimalType
    
    init(pet: AnimalType) {
        self.pet = pet
    }
    
    func play() -> String {
        return "I'm playing with \(pet.name). \(pet.sound())"
    }
}

class Dog: AnimalType {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sound() -> String {
        return "Bow wow!"
    }
}



