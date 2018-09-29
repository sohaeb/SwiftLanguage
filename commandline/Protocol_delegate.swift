//
//  Protocol_delegate.swift
//  commandline
//
//  Created by may on 2018-07-23.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/////////////////////////    Simple Delegate Example   ///////////////////////


protocol Cooking {
    func makingFood()
}

struct Momy: Cooking {
    func makingFood() { print("Pizza coming soon!") }
}

/*
 var mom = Mom()
 mom.makingFood() // "Pizza coming soon!"
 */

struct Babe {
    var delegate: Cooking? // delegate = someone with special skills
}

var babe = Babe()
var momy = Momy()

//babe.delegate = momy

//babe.delegate?.makingFood()

/*
 var babe = Baby()
 
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

/*
var objNew = Wow(firstName: "hello")

print(objNew.firstName)
*/

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/////////////////////////    Get  & Set     //////////////////////////////////

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

/*
let obj2 = LinearCongruentialGenerator()
print(obj2.random())
print(obj2.random())
*/



//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/////////////////////////    Protocol as Type for different alogrithoms    //////////////////////////////////



class DiceClass {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

/*
var d6 = DiceClass(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
// Random dice roll is 3
// Random dice roll is 5
// Random dice roll is 4
// Random dice roll is 5
// Random dice roll is 4
*/


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
/////////////////////////    Delegation     //////////////////////////////////


protocol DiceGame {
    var dice: Dice { get }
    func play()
}


protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}


class Dice {
    let sides: Int // 1 - 6
    let generator: RandomNumberGenerator // The algorithom to use
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    //
    //   The func that keeps returning numbers
    //
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

/*
 
 //// THe Snake & Ladder Game
 
 */
class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    
    var square = 0
    var board: [Int]
    
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    weak var delegate: DiceGameDelegate?
    
    func play() {
        
        square = 0
        delegate?.gameDidStart(self)
        
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        
        delegate?.gameDidEnd(self)
    }
}


class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}


/*
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()
// Started a new game of Snakes and Ladders
// The game is using a 6-sided dice
// Rolled a 3
// Rolled a 5
// Rolled a 4
// Rolled a 5
 // The game lasted for 4 turns*/



