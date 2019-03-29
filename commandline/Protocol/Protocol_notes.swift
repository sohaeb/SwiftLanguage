/*

Optional Protocol Requirements

You can define optional requirements for protocols, These requirements don’t have to be implemented by types that conform to the protocol.
Optional requirements are prefixed by the optional modifier as part of the protocol’s definition.
Optional requirements are available so that you can write code that interoperates with Objective-C





/*
 You can extend an existing type to adopt and conform to a new protocol,
 even if you don’t have access to the source code for the existing type.
 Extensions can add new properties, methods, and subscripts to an existing type,
 and are therefore able to add any requirements that a protocol may demand.
 */
 
 /*
 Conditionally Conforming to a Protocol
 A generic type may be able to satisfy the requirements of a protocol only under certain conditions, such as when the type’s generic parameter conforms to the protocol.
 You can make a generic type conditionally conform to a protocol by listing constraints when extending the type. Write these constraints after the name of the protocol you’re adopting by writing a generic where clause.
 For more about generic where clauses, see Generic Where Clauses.
 
 The following extension makes Array instances conform to the TextRepresentable protocol whenever they store elements of a type that conforms to TextRepresentable.
 
 */
 
 extension Array: TextRepresentable where Element: TextRepresentable {
 var textualDescription: String {
 let itemsAsText = self.map { $0.textualDescription }
 return "[" + itemsAsText.joined(separator: ", ") + "]"
 }
 }
 
 let myDice = [d6, d12]
 print(myDice.textualDescription)
 // Prints "[A 6-sided dice, A 12-sided dice]"
 
 //=====================================================================
 
 /*
 Declaring Protocol Adoption with an Extension
 
 If a type already conforms to all of the requirements of a protocol,
 but has not yet stated that it adopts that protocol, you can make it adopt the protocol with an empty extension
 */
 extension Hamster: TextRepresentable {}
 
 //=====================================================================
 
 /*
 Collections of Protocol Types
 
 type to be stored in a collection such as an array or a dictionary, as mentioned in Protocols as Types. This example creates an array of TextRepresentable things:
 
 let things: [TextRepresentable] = [game, d12, simonTheHamster]
 It’s now possible to iterate over the items in the array, and print each item’s textual description:
 */
 
 for thing in things {
 print(thing.textualDescription)
 }
 
 // A game of Snakes and Ladders with 25 squares
 // A 12-sided dice
 // A hamster named Simon
 
 /*
 
 Note that the thing constant is of type TextRepresentable.
 It’s not of type Dice, or DiceGame, or Hamster, even if the actual instance behind the scenes is of one of those types.
 Nonetheless, because it’s of type TextRepresentable, and anything that is TextRepresentable is known to have a textualDescription property,
 it’s safe to access thing.textualDescription each time through the loop.
 
 */
 
*/
