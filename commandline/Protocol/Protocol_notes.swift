/*

Optional Protocol Requirements

You can define optional requirements for protocols, These requirements don’t have to be implemented by types that conform to the protocol.
Optional requirements are prefixed by the optional modifier as part of the protocol’s definition.
Optional requirements are available so that you can write code that interoperates with Objective-C



 //=====================================================================
 //=====================================================================
 //=====================================================================



 
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
 //=====================================================================
 //=====================================================================
 
 /*
 Declaring Protocol Adoption with an Extension
 
 If a type already conforms to all of the requirements of a protocol,
 but has not yet stated that it adopts that protocol, you can make it adopt the protocol with an empty extension
 */
 extension Hamster: TextRepresentable {}
 
 //=====================================================================
 //=====================================================================
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



 //=====================================================================
 //=====================================================================
 //=====================================================================



Protocol Extensions
Protocols can be extended to provide method, initializer, subscript, and computed property implementations to conforming types. This allows you to define behavior on protocols themselves, rather than in each type’s individual conformance or in a global function.

For example, the RandomNumberGenerator protocol can be extended to provide a randomBool() method, which uses the result of the required random() method to return a random Bool value:

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
By creating an extension on the protocol, all conforming types automatically gain this method implementation without any additional modification.

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.3746499199817101"
print("And here's a random Boolean: \(generator.randomBool())")
// Prints "And here's a random Boolean: true"
Protocol extensions can add implementations to conforming types but can’t make a protocol extend or inherit from another protocol. Protocol inheritance is always specified in the protocol declaration itself.




 //=====================================================================
 //=====================================================================
 //=====================================================================





Providing Default Implementations
You can use protocol extensions to provide a default implementation to any method or computed property requirement of that protocol. If a conforming type provides its own implementation of a required method or property, that implementation will be used instead of the one provided by the extension.


 //=====================================================================
 //=====================================================================
 //=====================================================================



Adding Constraints to Protocol Extensions

hen you define a protocol extension, you can specify constraints that conforming types must satisfy before the methods and properties of the extension are available. You write these constraints after the name of the protocol you’re extending by writing a generic where clause. For more about generic where clauses, see Generic Where Clauses.

For example, you can define an extension to the Collection protocol that applies to any collection whose elements conform to the Equatable protocol. By constraining a collection’s elements to the Equatable protocol, a part of the standard library, you can use the == and != operators to check for equality and inequality between two elements.

extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}
The allEqual() method returns true only if all the elements in the collection are equal.

Consider two arrays of integers, one where all the elements are the same, and one where they aren’t:

let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]
Because arrays conform to Collection and integers conform to Equatable, equalNumbers and differentNumbers can use the allEqual() method:

print(equalNumbers.allEqual())
// Prints "true"
print(differentNumbers.allEqual())
// Prints "false"
NOTE

If a conforming type satisfies the requirements for multiple constrained extensions that provide implementations for the same method or property, Swift uses the implementation corresponding to the most specialized constraints.
*/






