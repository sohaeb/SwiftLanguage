//
//  catch_error.swift
//  commandline
//
//  Created by may on 2018-07-19.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation


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

//do {
//    let _ = try sum(val1: 1, val2: 3)
//
//} catch SomeError.AnotherWrongValue {
//    print("WrongValue.")
//
//} catch { // == same:  } catch let error { print(error)
//    print("Unexpected error: \(error).")
//}

