//
//  Boxing.swift
//  commandline
//
//  Created by may on 2018-07-19.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation

///////////////     B O X I N G    AND    U N - B O X I N G        ///////////


//////////////////////////////////////////////////////////////////////////////
////////////////      S T R U C T   Suhaib        ///////////////////////////

struct Suhaib {
    var name : String
}

//////////////////////////////////////////////////////////////////////////////
////////////////      C L A S S    B O X         /////////////////////////////


// Shared rather than copied
class Box {
    var suhaib : Suhaib?
    
    init(){ }
    
    init(suhaib : Suhaib) {
        self.suhaib = suhaib
    }
}


class Demo {
    var box : Box!
}

//////////////////////////////////////////////////////////////////////////////
/////////////////////      G E N E R I C    C L A S S         ////////////////

// Shared rather than copied

class Box_Generic<T> {
    
    var genericObj : T
    
    init(genericObj : T) {
        self.genericObj = genericObj
    }
}


class Demo_Generic {
    var box : Box_Generic<Suhaib>?
    //    var box : Box_Generic<Senan>?
    //    var box : Box_Generic<Anas>?
}


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/*

//  1st way
//var objBox = Box()
//objBox.suhaib = Suhaib(name: "helo")

//  2nd way Shorcut if you add:  init(suhaib : Suhaib)
// let obj2 = Box(suhaib: Suhaib(name: "shorcut"))

//  3rd way:
var stuct_Object = Suhaib(name: "suhaib")
var objBox3 = Box(suhaib: stuct_Object)

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

var demo1  = Demo()
demo1.box = objBox3

var demo2 = Demo()
demo2.box = objBox3

print("//  main_stuct_Object.name = \"suhaib\"")
print("// both demos.box = obj3")
print("demo1: \(demo1.box.suhaib?.name ?? "nil")")
print("demo2: \(demo2.box.suhaib?.name ?? "nil")")

stuct_Object.name = "test"

// HERE IS WHY WE NEED BOXING
// CHAINGING **stuct_Object** value DIDN'T affect any classes

print("// COOL STUFF: main_stuct_Object.name = \"test\"")
print("demo1 NOT AFFECTD: \(demo1.box.suhaib?.name ?? "nil")") // suhaib
print("demo2 NOT AFFECTD: \(demo2.box.suhaib?.name ?? "nil")") // suhaib

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////     We test chainging:   box3 -> Struct -> Name   /////////////////////

print("""
    //         demos.box = objBox3
    //  and    objBox3 = \"we cool\"
    """)

objBox3.suhaib?.name = "we cool"
print("// changing value of struct inside box3")
print("demo1 CHANGED: \(demo1.box.suhaib?.name ?? "nil")") // we cool
print("demo2 CHANGED: \(demo2.box.suhaib?.name ?? "nil")")  // we cool


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////     Test chainging:   demo2 -> Box -> Struct       ////////////////////
//////     or                demo2 -> Box -> Struct -> name     //////////////

print("""
        // HERE IS WHY WE NEED BOXING:
        - changing demo1 -> box won't affect demo2 -> box
    """)

let new_struct = Suhaib(name: "alright")
demo2.box = Box(suhaib: new_struct)
print("changing: box -> Struct inside demo2")
print("demo1 STAYED SAME: \(demo1.box.suhaib?.name ?? "nil")") // We cool
print("demo2 CHANGED: \(demo2.box.suhaib?.name ?? "nil")") // alright


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////     We test chainging:   demo2 -> Box after demo2 = demo1   /////////////////////

//
//demo2 = demo1 // demo2 is now -> WE cool
//demo2.box.suhaib?.name = "NEW"
//print("changing: box -> Struct inside demo2 && demo2 = demo1")
//print("demo1 CHANGED coz demo2 changed: \(demo1.box.suhaib?.name ?? "nil")")
//print("demo2  : \(demo2.box.suhaib?.name ?? "nil")")


demo2 = demo1 // demo1 is now -> We Cool

print("changing: demo1 = demo2 OR demo2 = demo1 doesn't matter")
print("demo1 : \(demo1.box.suhaib?.name ?? "nil")")
print("demo2  : \(demo2.box.suhaib?.name ?? "nil")")


demo2.box.suhaib?.name = "NEW"

print("changing: demo2.box OR demo1.box doesn't matter")
print("demo1 : \(demo1.box.suhaib?.name ?? "nil")")
print("demo2  : \(demo2.box.suhaib?.name ?? "nil")")

*/
