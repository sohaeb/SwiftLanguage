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

//=============================================

//          Now  Main()

//=============================================

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

//=============================================

//          Now  Main()

//=============================================


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



protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}


protocol DiceGame {
    var dice: Dice { get }
    func play()
}


////// DELEGATE CLASS

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
 
 //// THe Snake & Ladder Game
 
 */

class SnakesAndLadders: DiceGame {
    
    weak var delegate: DiceGameDelegate?
    
    let finalSquare = 25
    
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    
    var square = 0
    var board: [Int]
    
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
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


//=============================================

//          Now  Main()

//=============================================


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




/*
 
 //
 //  Protocol_delegate.swift
 //  commandline
 //
 //  Created by may on 2018-07-23.
 //  Copyright © 2018 sohaeb. All rights reserved.
 //
 
 import Foundation
 
 protocol RandomGenerator {
 func random()
 }
 
 class LinearAlgo : RandomGenerator {
 func random(){
 print("Linear")
 
 }
 }
 
 class CircularAlgo : RandomGenerator {
 func random() {
 print("Circular")
 }
 }
 
 
 class Dice {
 var gen : RandomGenerator
 var sides : Int
 
 init(gen: RandomGenerator, sides: Int){
 self.gen = gen
 self.sides = sides
 }
 }
 
 extension Dice : TextRepresentable {
 var textualDescription : String {
 return "Dice is a sides:" + sides
 }
 }
 
 //============================================================
 
 let dice = Dice(gen: LinearAlgo(), 6)
 dice.gen.random()
 
 //============================================================
 
 protocol DiceType {
 var dice : Dice { get }
 func play()
 }
 
 protocol Delegates : AnyObject { // MAKE IT ANYOBJECT SO THAT ONLY CLASS CAN ADOPT IT
 // Use a class-only protocol when the behavior defined by that protocol’s requirements assumes
 // or requires that a conforming type has reference semantics rather than value semantic
 func didStart(_ g: DiceType)
 func didEnd(_ g: DiceType)
 func game(startWithRoll roll: Int)
 }
 
 
 class ImplementDelegates : Delegates {
 
 var numberOfTurns =0
 
 func didStart(_ g: DiceType){
 print("game started with roll" + g.dice.sides) // FOUND IN SNAKE&LADDER CLASS
 }
 
 func game(startWithRoll roll: Int) {
 numberOfTurns += 1
 print("roll is " + roll)
 }
 
 func didEnd(_ g: DiceType){
 print("Round Eneded with" + numberOfTurns)
 }
 }
 
 class snakesAndLadder : DiceType {
 
 weak var delegate : Delegates? // IF WE MARK CLASS ONLY PROTOCOL WE CAN USE WEAK
 
 let dice = Dice(gen: LinearAlgo(), sides: 6) // THIS IS IMPORTANT
 
 init(){
 boards = Array(repeating:0, count: finalSquare+1))
 boards[03] += 5
 }
 
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
 delegate?.didEnd(self)
 }
 }
 
 extension snakesAndLadder : TextRepresentable {
 var textualDescription : String {
 return finalSquare
 }
 }
 
 let s&l = snakesAndLadder()
 print(s&l.textualDescription)
 
 
*/
