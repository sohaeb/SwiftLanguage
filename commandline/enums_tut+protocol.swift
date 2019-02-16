//
//  enums2.swift
//  commandline
//
//  Created by may on 2018-09-11.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation


enum Colors : String {
    
    case Red
    case Blue
    case Cyan
    case Green, Yellow
    
}


enum CSSColorTypes {
    case named(Colors)
    case rgb(UInt8, UInt8, UInt8)
}


// conform to a protocol
extension CSSColorTypes: CustomStringConvertible {
    
    // The extension style is nice because it makes what you define in order to conform to a given protocol fully explicit. In the case of CustomStringConvertible, you’re required to implement a getter for a description string property.
    
    //  CustomStringConvertible:  tells Swift that our type, CSSColor, can be converted to a string. We tell it how by implementing the description computed property.
    
    
    var description: String {
        switch self {
        case .named(let colorName):
            return colorName.rawValue  // We added (.rawValue) -> Coz enum.
        case .rgb(let red, let green, let blue):
            return String(format: "#%02X%02X%02X", red,green,blue)
        }
    }
    
    // Initializers with an Enum for (Gray)
    
    init(gray: UInt8) {
        self = .rgb(gray, gray, gray)
    }
   
    // let color3 = CSSColor(gray: 0xaa)
    // print(color3)  //  prints #AAAAAA
    
    
    //    Namespaces with Enum --    Named types can act as a namespace to keep things organized and minimize complexity.
    // Put enum inside struct
    
    enum ColorName: String {
        case black, silver, gray, white, maroon, red, purple, fuchsia, green, lime, olive, yellow, navy, blue, teal, aqua
    }
    
    
    
    
    
    
}



// To print stuff out:


//    // Version 1
//    let color = colorss.green
//    let type1 = CSSColoors.named(color)
//
//    // Version 2
//    let type2 = CSSColoors.named(.blue)
//
//
//    let rgbColor = CSSColoors.RGB(0xAA, 0xAA, 0xAA)
//
//
//    print(rgbColor) // no need for .description
//    print(type1) // no need for .description

