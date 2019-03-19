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
 
 //Some squares are then set to have more specific values for the snakes and ladders. Squares with a ladder base have a positive number to move you up the board, whereas squares with a snake head have a negative number to move you back down the board.
 
 board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
 board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
 //Square 3 contains the bottom of a ladder that moves you up to square 11. To represent this, board[03] is equal to +08, which is equivalent to an integer value of 8 (the difference between 3 and 11). To align the values and statements, the unary plus operator (+i) is explicitly used with the unary minus operator (-i) and numbers lower than 10 are padded with zeros. (Neither stylistic technique is strictly necessary, but they lead to neater code.)
 
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



