//
//  main.swift
//  SwiftInject
//
//  Created by dev on 2/8/17.
//  Copyright © 2017 Skander Jabouzi. All rights reserved.
//

//import Foundation
import Swinject


let container = Container()
container.register(Animal.self) { _ in Cat(name: "Mimi") }
container.register(Person.self) { r in PetOwner(pet: r.resolve(Animal.self)!) }

let person = container.resolve(Person.self)!
person.play() // prints "I'm playing with Mimi."

