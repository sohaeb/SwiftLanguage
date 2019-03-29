//
//  AnyVSAnyObject.swift
//  commandline
//
//  Created by may on 2019-03-19.
//  Copyright © 2019 sohaeb. All rights reserved.
//

import Foundation

//AnyObject points to classes and can’t point to enum/structs

////class Test {}
///class Test2 {}
///var test:[AnyObject] = [Test(),Test2()]

//Any to anything

///class Test {}
///var test:[Any] = [Test(),"a",0]


//Off-topic: Why does String which is struct can be allowed to be used in [Anyobject] ? Coz Objective C bridging lets you make String swift as a class.



//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


// COOOOL TRICK for ANYOBJECT in OUTLETS:

/// @IBACTION func touch(sender: AnyObject)  // Don't USE UIBUtton, why ? See below
///    if let sender = sender as? UIButton {
            /// Do Stuff
///    } else if let sender = sender as? UISilder {
            /// Do Stuff
///   }
