//
//  RandomGen.swift
//  commandline
//
//  Created by may on 2019-03-19.
//  Copyright © 2019 sohaeb. All rights reserved.
//

import Foundation

/*
 
 let finalSquare = 25
 var board = [Int](repeating: 0, count: finalSquare + 1)
 
 board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
 board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
 
 var square = 0
 var diceRoll = 0
 
 
 //=============================================
 
 //          ( while)
 
 //=============================================
 
 while square < finalSquare {
 // roll the dice
 diceRoll += 1
 if diceRoll == 7 { diceRoll = 1 }
 // move by the rolled amount
 square += diceRoll
 if square < board.count {
 // if we're still on the board, move up or down for a snake or a ladder
 square += board[square]
 }
 }
 print("Game over!")
 
 
 //=============================================
 
 //          OOOOORRRRRR (repeat - while)
 
 //=============================================
 
 
 repeat {
 // move up or down for a snake or ladder
 square += board[square]
 // roll the dice
 diceRoll += 1
 if diceRoll == 7 { diceRoll = 1 }
 // move by the rolled amount
 square += diceRoll
 } while square < finalSquare
 print("Game over!")
 
 
 //=============================================
 
 //          OOOOORRRRRR (Labelled while + switch)
 
 //=============================================
 
 
 gameLoop: while square != finalSquare {
 diceRoll += 1
 if diceRoll == 7 { diceRoll = 1 }
 switch square + diceRoll {
 case finalSquare:
 // diceRoll will move us to the final square, so the game is over
 break gameLoop
 case let newSquare where newSquare > finalSquare:
 // diceRoll will move us beyond the final square, so roll again
 continue gameLoop
 default:
 // this is a valid move, so find out its effect
 square += diceRoll
 square += board[square]
 }
 }
 print("Game over!")
 
 */



