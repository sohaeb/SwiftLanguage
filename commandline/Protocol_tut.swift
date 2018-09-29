//
//  Protocol_tut.swift
//  commandline
//
//  Created by may on 2018-09-11.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation
protocol Animal {
    var numberOfLimbs: Int { get }
    var isVertebrate: Bool { get }
    var canSwim: Bool { get }
    var canBreatheUnderwater: Bool { get }
    var canFly: Bool { get }
}

extension Animal {
    func eat(food: Food) { }
    var canSwim: Bool { return self is Swimmable }
    var isVertebrate: Bool { return self is Vertebrate }
    var canBreatheUnderwater: Bool { return self is WaterBreathable }
    var canFly: Bool { return self is Flyable }
}

protocol Vertebrate { }
protocol Invertebrate { }
protocol Flyable { }
protocol Swimmable { }
protocol WaterBreathable: Swimmable { }

protocol Slitherable { }

protocol Reptile : Vertebrate { }

extension Reptile where Self : Animal {
    // We’re just implementing these default behaviors to these classes in the case that they are also Animal
    //By using this pattern, that we can continue defining default behaviors for Animal
    var limbs : Int { return self is Slitherable ? 2 : 4  }
}



protocol Mammal: Vertebrate {
    var hasPouch: Bool { get }
}

protocol Marsupial: Mammal { }
extension Mammal {
    var numberOfLimbs: Int {
        return 4
    }
    var hasPouch: Bool {
        return self is Marsupial
    }
}

protocol Bird: Vertebrate { }
extension Bird where Self: Animal {
    var canFly: Bool {
        return self is Flyable
    }
    
    var numberOfLimbs: Int {
        return 4
    }
}

protocol Fish: Vertebrate, WaterBreathable { }
extension Fish where Self: Animal {
    var numberOfLimbs: Int {
        return 0
    }
}




struct Lion: Animal, Mammal, Swimmable { }
// Wow, look at that! We don’t have to fill out a body for these structs
// because their behaviors are already implemented by their backing protocols.
struct Cow: Animal, Mammal { }









protocol Food { }
struct Grass: Food { }
struct Meat: Food { }

// Cows don’t eat Food; they eat Grass. Similarly, lions don’t eat generic Food, they eat Meat.


// JAVA
/*
 struct Cow: Animal, Mammal {
 func eat(food: Food) {
 if food is Grass {
 // implementation
 } else {
 // throw error or crash
 }}}
 */


//Swift allows an alternative approach, involving the oft-maligned associatedtype keyword. An associated type is a placeholder type within a protocol. Implementing associated types allow you to use a “generic” type in your protocol but be warned, they are not quite generic protocols, nor do they come without drawbacks. When using a protocol with an associated type, you will lose the ability to use that protocol as a type. You’ll only be able to use it as a generic constraint. You’ll also lose the ability to use the protocol in a heterogeneous collection; you can no longer have an array of Animal objects, but you’ll be able to have an array of Lion objects.

/*
 protocol Animal {
 
 THIS   --->  associatedtype FoodType
 
 func eat(food: FoodType)
 ...
 }
 */


//Let’s assume that instead of having just Cow and Lion, that we had hundreds of Animals. Manually implementing an eat function on possibly hundreds of types is cumbersome, so let’s use protocols to circumvent that.

protocol Carnivorous { }
protocol Herbivorous { }
protocol Omnivorous { }

extension Carnivorous where Self: Animal {
    func eat(food: Meat) {
        // noms implementation
    }
}

extension Omnivorous where Self: Animal {
    func eat(food: Food) {
        // noms implementation
    }
}

extension Herbivorous where Self: Animal {
    func eat(food: Grass) {
        // noms implementation
    }
}

//At this point, we just have to decide what kinds of eaters our existing animals are — A much easier task than manually implementing a function across multiple types!



typealias BigCat =  Animal & Mammal & Swimmable & Carnivorous
typealias BirdOfPrey = Animal & Bird & Flyable & Carnivorous
typealias Primate = Animal & Mammal & Swimmable & Omnivorous

struct Gorilla: Primate { }
struct Monkey: Primate { }
struct Eagle: BirdOfPrey { }
struct Hawk: BirdOfPrey { }
struct Tiger: BigCat { }





