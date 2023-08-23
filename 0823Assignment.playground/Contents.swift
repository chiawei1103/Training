import UIKit

// Due Date: 08/24

// Interview Qeistion (Theory)

///1. How to create mutable and immutable types in Swift
/*
 To create mutable type of variables, we can use "var" to be the keyword of the variable declaration
 To create immutanle type of variables, we can use "let" to be the keyword of the variables declaration
 */
    
/// 2. What is Type Safety
/*
 Type Safety is how safety is a programming language deal with variable types on declaration.
 If the programming language is "Type Safety", it means we have to declare the type of variable or initialize the variable when we create one. Otherwise the compiler would throw an error. For example, "swift" is one of type-safety programming languages.
 */

/// 3. What is Type Inference
/*
Type Inference means that the compiler can infer what type of the variable is when we declare it implicitly.
 For example, if we create a variable in the following way:
 let num = 42
 The compiler would know that "num" is a integeger based on the value that is being assigned.
 */

/// 4. How to create explicit and implicit variables
/*
 Explicit:
 let num : Int = 0
 
 Implicit:
 let num = 0
*/

/// 5. What is Optionals
/*
 When a variable is declared as a question mark behind its type, that means the variable can be nil.
 */

/// 6. How to do optional binding
/*
 There are two ways to do the optional binding.
 One, "if let". Two, "guard let"
 The syntax for the first one would be:
 if let newVariableName = optionalVariableName { }
 
 The syntax fot the second one would be:
 guard let newVariableName = optionalVariableName else { return }
 */

/// 7. Diff b/w if let and guard let
/*
 The biggest and obvious difference between them is that in guard let, we can process the "else" situation and return different value. In if let, we do need to return statement, the compiler would just not execute the function.
 */

/// 8. What is nil coalescing operator
/*
 Nil coalescing is one of methods to unwrap optional variables.
 By giving a default value to the optional variable after double question marks, the variable would be unwrapped.
 */

/// 9. What is protocol
/*
 It is a blueprint of methods or properties that can be applied by classes ot other types.
 It is just a interface, the methods or properties definition, not their body.
 */

/// 10. What is class
/*
 Class is a kind of object that includes properties, actions. It is another way of creating complex data types.
 It looks similar to struct
 */

/// 11. Diff b/w struct and class
/*
The obvious differenc between them is when we create an instance of a class and copy that class. Change one, and the copy would change too. However, when we create an instance of struct and copy the struct . Change one, and the copy won't change.
 That is because class uses heap memory and struct uses stack memory.
 */

/// 12. Diff b/w array, dict Set
/*
 Three of them are type of data collection. Array is not ordered collection and have duplicate values. Dic is not ordered and have duplicate values. Set is not ordered collection and will not have duplicate values.
 */

// Coding Question
// 1. remove duplicate chars from a String
    // input : "aabbccdd" : output : abcd
var inputString = "aabbccdd"
let outputString = String(Set(inputString))
print("1.  \(outputString)\n")

// 2. remove duplicate element from an array
    // input : [1, 2, 2, 3, 4, 7, 5, 5]
    // output : [1, 2, 3, 4, 7, 5]

var inputArray = [1, 2, 2, 3, 4, 7, 5, 5]
var outputArray = Set(inputArray)
print("2.  \(outputArray)\n")


// 3. Create a class of Student with 4 attributes and 3 actions

class Student {
    var name: String = ""
    var studentID: Int = 0
    var gender: String = ""
    var major: String = ""
    var course: [String] = []
    
    func enrollCourse() {
        
    }
    
    func dropCourse() {
        
    }
    
    func getTranscipt() {
        
    }
}

// 4. Create array of 10 students objects and iterate through each student and print all students names
var students : [Student] = []
let student1 = Student()
student1.name = "Alex"
students.append(student1)

let student2 = Student()
student2.name = "Bob"
students.append(student2)

let student3 = Student()
student3.name = "Cook"
students.append(student3)

let student4 = Student()
student4.name = "David"
students.append(student4)

let student5 = Student()
student5.name = "Evon"
students.append(student5)

let student6 = Student()
student6.name = "Fillip"
students.append(student6)

let student7 = Student()
student7.name = "George"
students.append(student7)

let student8 = Student()
student8.name = "Husky"
students.append(student8)

let student9 = Student()
student9.name = "Isaac"
students.append(student9)

let student10 = Student()
student10.name = "Jacob"
students.append(student10)

for (index,student) in students.enumerated() {
    print("4.   \(index+1))  \(student.name)")
}

// 5. Create Optional variable and show use of optional binding
var possiblFruit: String? = "Apple"
if let fruit = possiblFruit {
    print("5.  \(fruit)")
}
