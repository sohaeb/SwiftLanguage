//
//  wedding_protocol_4.swift
//  commandline
//
//  Created by may on 2019-02-15.
//  Copyright © 2019 sohaeb. All rights reserved.
//

import Foundation



//=============================================

//          Define  Protocols

//=============================================


protocol FoodDelegate {
    func cook()
}


//=============================================

//          Implement  Protocols

//=============================================


class AlSamadResturant : FoodDelegate {
    
    func cook() {
        print("Cooking food")
        
        // This will be called when you do this:
        // let venue = HotelVenue()
        // Then:
        // venue.foodDelegate   = AlSamadResturant()
        // and:
        // venue.cookFood()
        
    }
    
    func bringItHotel() {
        print("Deliver it to hotel")
    }
}




//=================================================
//
//         1-  Set    the    delgates
//        2- Implement other  functions not in Proto
//            i.e:  Start_Dance()
//
//=================================================


class HotelVenue {
    
    // Called Hotel Venue coz it brings everyone together
    
    var foodDelegate : FoodDelegate?

    //////////////////////////////////////
    //  Not Necessary, but good design//
    //////////////////////////////////////

    /*
    func cookFood() {
        print("cookFood() called")
        return (foodDelegate?.cook())!
    }
 */
    
}

//=============================================

//          Now  Main()

//=============================================

// Old Method
//=============================================

//let pos = AjmanMedia()
//
//wed.posssster = pos
//wed.posssster?.design()


// Here is the new trick
//=============================================

//let venue = HotelVenue()
//
//venue.foodDelegate   = AlSamadResturant()
//
//venue.deliverFood()
//venue.cookFood()
