//
//  main.swift
//  commandline
//
//  Created by may on 2018-07-18.
//  Copyright © 2018 sohaeb. All rights reserved.
//

import Foundation

//enum anError : Error {
//    case someValue
//    case ggValue(reason: String)
//    case hmm
//}
//
//func testingError() throws {
//    if 1 == 2 {
//        throw anError.someValue
//    } else {
//        throw anError.ggValue(reason: "Wow")
//    }
//}


//do {
//     let _ = try testingError()
//} catch  anError.someValue {
//    print("stuff")
//} catch {
//    print(error)
//}











/*
 
 protocol RandomGenerator2 {
 func random()
 }
 
 //----//----//----//----//----//----//----//----//----
 
 class LinearAlog2 : RandomGenerator2 {
 func random() {
 print("algo1")
 }
 }
 
 class LinearAlog23 : RandomGenerator2 {
 func random() {
 print("algo2")
 }
 }
 
 class LinearAlog24 : RandomGenerator2 {
 func random() {
 print("algo3")
 }
 }
 
 class LinearAlog25 : RandomGenerator2 {
 func random() {
 print("algo4")
 }
 }
 
 //----//----//----//----//----//----//----//----//----
 
 class Dice2 {
 var sides : Int
 var gen : RandomGenerator2
 
 init(gen: RandomGenerator2, sides: Int) {
 self.gen = gen
 self.sides = sides
 }
 
 func rolling() {
 gen.random()
 }
 }
 
 //let diceObj = Dice2(gen: LinearAlog2(), sides: 6)
 //diceObj.rolling()
 
 protocol DiceProtocol {
 
 var dice : Dice2 { get }
 //    func play()
 }
 
 protocol DiceDelegate {
 func gameDidStart(_ g: DiceProtocol)
 func gameDidEnd(_ g: DiceProtocol)
 func game(_ g: DiceProtocol, didStartNewTurnWithDiceRoll diceRoll: Int)
 }
 
 */

//------------------------------------------------------------------


//struct Downloader {
//
//    // MARK:- Alias
////    typealias DownloadResults = ([Children]?, Error?) -> ()
//
//    var errorMessage = ""
//    let defaultSession = URLSession(configuration: .default)
//    var dataTask: URLSessionDataTask?
////    var arrayOfChildren = [Children]()
//
//    // MARK:- Methods
//
//    //
//    // This func downloads data asynchronosly from a given url
//    // Then it calls update(_:) method to decode the data
//    // and then pass them around as a completionHandler to be used by other classes
//    //
//    mutating func getSearchResults(url: String, completion: @escaping (Error?) -> Swift.Void) {
//
//        dataTask?.cancel()
//
//        guard let url = URL(string: url ) else { return }
//
//        dataTask = defaultSession.dataTask(with: url) { data, response, error in
//            defer { self.dataTask = nil }
//
//            if let error = error {
////                print("Error is \(error)")
//            } else if let data = data,
//                let response = response as? HTTPURLResponse,
//                response.statusCode == 200 {
//
//                print("Data is \(data)")
//                // decode the json data
//                self.update(data: data)
//
//                DispatchQueue.main.async {
////                    completion(self.arrayOfChildren, error)
//                }
//            } else {
//                print("Subreddit is either private or Banned")
//            }
//        }
//        dataTask?.resume()
//    }
//
//    //
//    // This func decodes instances of a data type from JSON objects.
//    //
//    func update(data: Data) {
//
//        let decoder = JSONDecoder()
//
//        do {
////            let todo = try decoder.decode(Reddit.self, from: data)
//            // self.arrayOfChildren will be used in "completion(self.arrayOfChildren, error)"
////            self.arrayOfChildren = todo.data.children
//        } catch {
//            print("error trying to convert data to JSON in URLsession taks func")
//        }
//    }
//}
