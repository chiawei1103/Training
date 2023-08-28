import UIKit


//1 . Given an input array find 2nd maximum number from array

// Input  =  [1,2,4,6,7,8,9,10,3,4,6]
// output =  9
let inputArray1 = [1,2,4,6,7,8,9,10,3,4,6]
var inputDic1 = [Int: Int]()
for (index, item) in inputArray1.enumerated() {
    inputDic1.updateValue(index, forKey: item)
}

let answer1 = inputDic1.sorted(by: { $0.value < $1.value })[inputDic1.count-2].value
print("1.   \(answer1)")


//2; given input array and and a target number , find the combination of 2 numbers whose sum is equal to target number


// input = [1,2,4,6, 0]  , Target Number = 5
// output = [1,4]

let inputArray2 = [1, 2, 4, 6, 0]
let targetNum = 5
var outputArray2 = [Int]()

for item in inputArray2 {
    if (targetNum - item) > 0 {
        let output2 = inputArray2.first { $0 == targetNum - item }
        if let output = output2 {
            outputArray2.append(item)
            outputArray2.append(output)
            break
        }
    }
}
print("2.   \(outputArray2)")

// 3. Coding Challange PDFvar greeting = "Hello, playground"


