////
////  enumss.swift
////  commandline
////
////  Created by may on 2018-09-11.
////  Copyright © 2018 sohaeb. All rights reserved.
////
//
//import Foundation
//
////----------------------- Basics


 enum Color {

// The reason why you want to add " Eye : String"  so that you can value as string "red" when you print it
// + // You must define a type to use (rawValue )

    case red
    case blue
    case green, cyan
    
}

//----------------------- Implicitly Assigned Raw Values

// int: --> numbers
 enum Planet: Int {
     case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
 }

// let earthsOrder = Planet.earth.rawValue
//// earthsOrder is 3

// string: --> Its name
 enum CompassPoint: String {
     case north, south, east, west
 }

// let sunsetDirection = CompassPoint.west.rawValue
//// sunsetDirection is "west"


//------------------------ Initializing from a Raw Value

// let possiblePlanet = Planet(rawValue: 7)
//// possiblePlanet is of type Planet? and equals Planet.uranus

//------------------------ Switch + Enum


// let rightEye = Eye.right

// switch rightEye {
// case .left:
//     print("left")
// case .right:
//     print("right")
//}

////Enums can define things that take inputs or functions
////-----------------------------------------------------

 enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// var productBarcode = Barcode.upc(8, 85909, 51226, 3)
// productBarcode = .qrCode("ABCDEFGHIJKLMNOP")


// switch productBarcode {
// case .upc(let numberSystem, let manufacturer, let product, let check):
//     print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
// case .qrCode(let productCode):
//     print("QR code: \(productCode).")
// }


////------------------------ Iterate over it
//// have a collection of all of that enumeration’s cases.
//// You enable this by writing : CaseIterable after the enumeration’s name



enum Beverage: CaseIterable {
  case coffee, tea, juice
}

// // let numberOfChoices = Beverage.allCases.count

// // print("\(numberOfChoices) beverages available")
////// Prints "3 beverages available"

// // for beverage in Beverage.allCases {
//  print(beverage)
// }



////------------------------ Swift Enums can have functions


enum hahaha : Int {
    
    // You must define a type in Enum to use (rawValue ) as below
    
    case first
    case second
    case third
    
    func move() -> hahaha {
        return hahaha(rawValue: rawValue - 1) ?? .first
    }
}

////------------------------ Enum + Protocol COnforance

protocol Togglable {
    mutating func toggle()
}


enum OnOffSwitch: Togglable {
    
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

// var lightSwitch = OnOffSwitch.off
// lightSwitch.toggle()
// lightSwitch is now equal to .on



enum CompassPoint1 {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

//var currentDirection = CompassPoint1.west
//let rememberedDirection = currentDirection
//currentDirection.turnNorth()



//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

