//
//  classVsStruct.swift
//  commandline
//
//  Created by may on 2018-07-18.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation

struct suhaib {
    var x : String
    var y : String
    
    // As you noticed, no need for init()
}

class Senan {
    
    // Compiler Default init stuff here
    
    let value2 : suhaib = suhaib(x: "h", y: "i")
    
    let value : suhaib? = nil // adding a NIL to STRUCT is a MUST
    
    var x : String? // will be init with a nil
    
    var y : String = "Hello" // will be init with a "Hello"
    
    // var y : String
    // **WITHOUT** a DEFAULT value --> you need to CREATE init()
    
}

// STRUCT --> Memberwise init works ✅
// let obj = suhaib(x: <#T##String#>, y: <#T##String#>)
    // or
// let obj = suhaib() ✅


// you can't do member wise init like Struct 🔴
// let senan = Senan()

/*
 
 //////////////////////////////////////////////////////////////////////
 
Difference between STRUCT VS CLASS
 
 (Always use Struct unless you need class for resons above)
 
 STRUCT:
 1- Value types
 (Things get copied, thus, changing the struct obj doens't affect other oject)
 i.e: create two seperate objects
 2- member-wise init
 
 
CLASS:
1- Inheritance
2- deinit
4- type casting to check and interpret the type of a class instance at runtime.
3- Class is a Refrence type:
Reference counting allows more than 1 reference to a class instance.

- Reference is established instead of copying
(Rather than a copy, a reference to the same existing instance is used.)

- Because classes are reference types, tenEighty and alsoTenEighty
actually both refer to the same VideoMode instance. Effectively,
they are just two different names for the same single instance,

- Thus, changing one object, changes all objects that also points to it
reference types can be harder to reason about. If object1 and object2 were far apart in your program’s code, it could be difficult to find all the ways that the video mode is changed. Wherever you use object1, you also have to think about the code that uses object2, and vice versa.
In contrast, value types are easier to reason about because all of the code that interacts with the same value is close together in your source files.
 
 */

//////////////////////////////////////////////////////////////////////

/*
 
 Because classes are reference types, it’s possible for multiple constants and variables to refer to the same single instance of a class behind the scenes. (The same isn’t true for structures and enumerations, because they are always copied when they are assigned to a constant or variable, or passed to a function.)
 
 It can sometimes be useful to find out whether two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:
 
 Identical to (===)
 Not identical to (!==)
 Use these operators to check whether two constants or variables refer to the same single instance
 
 if obj1 === obj2 {
 print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
 }
 
 */

