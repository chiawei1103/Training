import UIKit



//

// 1 1  2  3  5  8  13  21  34 .....


// input : a gvien number from fibonicee series like 5
// size of fibnocie , starting gvien fib number = 4

// [5 , 8 , 13, 21]


//  input  8 ,  3
//  output = [8 , 13,  21 ]


let input = [8, 3]
print("Input: \(input)")
var output: [Int] = []
// do this using higher order function


var fibonacci: [Int] = [1,1]
let fibonacciSize = 50
let sequence = Array(1...fibonacciSize)

for _ in 1...fibonacciSize {
    fibonacci.append( fibonacci[fibonacci.count-2] + fibonacci[fibonacci.count-1] )
}

let i: Int = fibonacci.firstIndex(of: input[0]) ?? 0

for index in 0..<input[1] {
    output.append(fibonacci[index + i])
}
print("Output: \(output)")



// 1. what is GCD
//  - GCD stands for Grand Central Dispatch, which is a low-level API for managing concurrent operations and multi-threading. It can deal with performing multiple tasks at the same time.

// 2. What is QOS
//  - QOS stads for Quality Of Service, which help us categorize the task of our DispatchQueue with priority.There are five priorities: userInteractive, userInitiated, defaul, utility, background

// 3. what is diff b/w main q and glboal q
//  - Main Queue runs in the main thread, however, Global Queue runs in the background thread.

// 4. Default queus provided by GCD
//  - GCD provide two types of queue: Main Queue and Global Queue.

// 5. will you use global q or custom concurrent queue , which one and why
//  - Custom concurrent queue. because it allows us to specify a label, which is helpful for debuggin. Hence, we can suspend it ,and set & get specific data.

// 6. what is higher order functions , examples
//  - Higher order functions are functions that operate other functions by either taking functions as parameter, or returning a function.
//  For example, Map, Compact Map, Flat Map, Reduce, Filter, Sort, Sorted

// 7. Diff b/w map and compactmap
//  - Compact Map will unwrap optional values and remove nil for the array.

// 8 . what reduce does
//  - Reduce takes two parameters: one is the initial value, the other is a closure which take two parameters as well.
//      One parameters is the previous value, the other is the current value in the collection. The operation will apply to these two parameters in the closure.

// 9 . diff b/w sort and sorted
//  - Instead changin the original collection, Sorted will return a new collection. Sort will change the original collection.



// Assignment during class

// add delete button in country cell and on click of that delete country from array and refresh tableView

 // Note : don't use swipe delete action.
