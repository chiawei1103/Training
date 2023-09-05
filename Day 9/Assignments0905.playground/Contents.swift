import UIKit

var greeting = "Hello, playground"


// 


//1. In Countires code, separate the netowork layer to different class.
//
//1.1 communicate from network Manager to Controller using Protocol Delegate
//
//1.1 communicate from network Manager to Controller using Escaping closure

// In both 1.1 and 1.2 along with Countireis if api fails pass error back to view and show error in UI.




/// 1. what is diff b/w escaping and non escaping
//  - One of the differences between them is non-escaping closure release the function argument from memory, after the execution ends. But escaping closure presuerce the functin argument in memory, the scope of the passed closure exist.

/// 2. what is associated values
//  - It is a way to attach additional information to enum values
// for example: enum Direction {
//                    case north(String)
//                }

/// 3. what is raw values
//  - It's a methods to assign cases a specific value
//    for example: enum Direction: String {
//                    case north = "N"
//                }

/// 4. what is Generics
//  - Generics code allows us to write flexible, reusable functions and types that can work with any type, which can avoid duplication.
func displayData<T>(data: T) {
    print("Data: \(data)")
}
displayData(data: "Hello world!")
displayData(data: 10)



