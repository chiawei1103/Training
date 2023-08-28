import UIKit

// Due Date : 25/08

// Interview Questions (Theory)

/// 1.  What is initilizers, use with example
// - Classes and structures must set all of their properties to an inital value when that class or structure is created.
// For example:
class Student {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

/// 2. What is protocol extension
// - Protocols describe what methods should have, such a blueprint, but have the function body inside. Extension provides default behaviors to the protocol methods and could avoid duplicated calling and customized calling.

/// 3. What is class extension
// - Class extension is used to additional functionality to an existing class.

/// 4. What is type alias
// - Type Alias allows a name to refer to existing types, could be used to combine protocols and closures.

/// 5. What is storybaords behind the scene
// - Storyboard is apart of interface builder which includes an empty canvas type screen. We can create almost everything and add accosiate a view controller to interact with UI.

/// 6. What is closure
// - Closure is a convenient way of naming and defining function. It makes functions could be called as a parameter.



// Codign Questoins

//1 create project which have  login Screen with userName , password fields and login button , it should work on iPhone and ipad and different Orientations

//2. Create project which have  Calculator Kind of UI with numbers and different operations

// 3. Create a closure to take firstName , lastName as param and return fullName
var getFullName: (String, String) -> String = { firstName, lastName in
    return firstName + " " + lastName
}
let fullName = getFullName("Lawrence", "Tsai")
print("3. \(fullName)")

