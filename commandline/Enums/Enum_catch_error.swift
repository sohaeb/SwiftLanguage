//
//  catch_error.swift
//  commandline
//
//  Created by may on 2018-07-19.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation

///////////////////////////////////////////////////////////

//      Enums : No Error Protocol

///////////////////////////////////////////////////////////


struct Dog {
    var name: String
    var age : Int
}

enum DogResult {
    case Success(Dog)
    case Failure(errorText: String)
}

func create(age: Int?, name: String?) -> DogResult {
    
    if let age = age, let name = name, name.count > 0, age > 0 {
        if let dog = Dog(name: name, age: age) {
            return DogResult.Success(dog)
        } else {
            return DogResult.Failure(errorText: "Age is invalide")
        }
    } else {
        return DogResult.Failure(errorText: "Info is missing")
    }
}


///////////////////////////////////////////////////////////

        //      Enums : Error Protocol

///////////////////////////////////////////////////////////


enum SomeError : Error {
    case WrongValue(reason: Double)
    case AnotherWrongValue
}

func sum(val1 : Double, val2: Double) throws -> Double {
    if val1 != 2 {
        throw SomeError.WrongValue(reason: val1)
    }
    
    if val2 == 3 {
        throw SomeError.AnotherWrongValue
    }
    return 10
}

///do {
///    let _ = try sum(val1: 1, val2: 3)

///} catch SomeError.AnotherWrongValue {
///    print("WrongValue.")

///} catch { // == same:  } catch let error { print(error)
///    print("Unexpected error: \(error).")
///}

