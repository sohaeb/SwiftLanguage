//
//  protocol basic.swift
//  commandline
//
//  Created by may on 2019-02-15.
//  Copyright © 2019 sohaeb. All rights reserved.
//

import Foundation


protocol sohaeb {
    var name : String { get }
    var last : String { get set }
    
    func wow()
}


class Father : sohaeb {
    
    func wow() {
        print("Hello")
    }
    
    var name : String {
        return "Suhaib"
    }
    
    var last : String  = "THis is how its done"
    
}


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/////////////////////////    Simple Delegate Example   ///////////////////////


protocol Cooking {
    func makingFood()
}

struct Momy: Cooking {
    func makingFood() { print("Pizza coming soon!") }
}

struct Babe {
    var delegate: Cooking? // delegate = someone with special skills
}

//=============================================

//          Now  Main()

//=============================================

/*

var babe = Babe()
var momy = Momy()

 babe.delegate = mom
 // The type of the delegate property is “Cook?”.
 // The type of the “mom” can be both “Cook” and “Mom”
 // since she conforms to the “Cook” protocol.
 
 babe.delegate?.makingFood() // "Pizza coming soon!"
 
 */


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/////////////////////////    Get  ONLY   ////////////////////////////////////////


protocol test {
    var firstName : String { get }
}

struct Cool : test {
    var firstName: String {
        return "cool"
    }
}

//=============================================

//          Now  Main()

//=============================================


/*
 var obj1 = Cool()
 
 print(obj1.firstName)
 */

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/////////////////////////    Get  & Set     //////////////////////////////////


protocol newTest {
    var firstName : String { get set }
}

struct Wow : newTest {
    var firstName: String
}

//=============================================

//          Now  Main()

//=============================================


/*
 var objNew = Wow(firstName: "hello")
 
 print(objNew.firstName)
 */

