//
//  PetOwner.swift
//  SwiftInject
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

import Foundation

protocol Person {
    func play()
}

class PetOwner: Person {
    let pet: Animal;
    
    init(pet: Animal) {
        self.pet = pet;
    }
    
    func play() {
        let name = pet.name ?? "Someone";
        print("I'm playing with \(name)");
    }
}
