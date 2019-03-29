//
//  enums2.swift
//  commandline
//
//  Created by may on 2018-09-11.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation



///////////////////////////////////////////////////////////

                //Stanford Example
        //Enums + Dictionary + Struct

///////////////////////////////////////////////////////////


//Enum:
enum cool {
    
    case Constant(Double)
    case Unary((Double) -> Double)
    case Binary((Double, Double) -> Double)
    
}

/*
 
//Dictionary:
func multiply(op1, op2) -> Double {
    return op1 + op2
}

var stuff : Dictionary<String, cool> = [
    "pi" : cool.Constant(Double.pi),
    
    // No closure
    "+" :  cool.Binary(multiply)
    
    // Shortcut Closure
    "-"  : cool.Unary({ -$0 }),
    "+" : cool.Binary({$0 + $1}),
    
    // Full Closure
    "negation" : cool.Unary({ (value) -> Double in
        return -1 * value
    }),
    
    "addition" : cool.Binary({ (first, second) -> Double in
        return first + second
    }),
]

//////////////////////////////////////////////////////////////////////////////

/*
 
 // To bes used below:
 
 func pending_value() {
 if struct_obj == nil
 return
 } else if struct_obj != nil {
 accum = struct_obj!.function_in_struct_that_takes_2args(struct_obj.First_value_container, accum)
 struct_obj = nil
 }
 //////////////////////////////////////////////////////////////////////////////
 
 //Switch:
 
 var struct_obj : container_struct!
 var accum : Double = 5 // the 1st number pressed in calculator before u press “add”
 
 func wow(symbol: String) {
 
 if let op = stuff[symbol] {
 switch op {
 
 case .Constant(let value):
 print(value)
 // { $0 }
 case .Unary(let Func_take_1_arg_from_switch_case_which_is_Unary):
 let result = Func_take_1_arg_from_switch_case_which_is_Unary(3)
 // result is -3
 case .Binary(let Func_take_two_arg_from_switch_case_which_is_Binary):
 pending_value()
 
 struct_obj = container_struct(First_value_container:accum,
                            function_in_struct_that_takes_2args: Func_take_two_arg_from_switch_case_which_is_Binary)
                case .Equal
                pending_value() // this will add the second number to the 1st saved number
            }
        }
    }
 
 //////////////////////////////////////////////////////////////////////////////
 
 wow(symbol: "addition")
 
 */
*/
