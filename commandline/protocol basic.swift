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
    
    var last : String {
        get {
            return "Nabiel"
        }
        
        set {
            self.last = newValue
        }
    }
    
}
