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
    func bringItHotel()
}

protocol DJDelegate {
    func selectMusic()
    func playMusic()
}

protocol DesignPosterDelegate {
    func printPoster()
    func createPoster()
}

protocol ServantsDelegate {
    func welcomePeople()
    func bringFood()
    func helpAttendies()
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


class EgyptianWomen : DJDelegate {
    
    func selectMusic() {
        print("list of music")
    }
    
    func playMusic() {
        print("on the day of the wedding play music")
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
    var egyptionDJDelegate : DJDelegate?
    
    func deliverFood() {
        print("deliverFood() called")
        return (foodDelegate?.bringItHotel())!
    }
    
    func cookFood() {
        print("cookFood() called")
        return (foodDelegate?.cook())!
    }
}

//=============================================

//          Now  Main()

//=============================================


//
//let venue = HotelVenue()
//
//venue.foodDelegate   = AlSamadResturant()
//
//venue.deliverFood()
//venue.cookFood()
