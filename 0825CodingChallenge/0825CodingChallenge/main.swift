//
//  main.swift
//  0825CodingChallenge
//
//  Created by Consultant on 8/25/23.
//

import Foundation

func getInput()-> String {
    guard let input = readLine() else {
        return ""
    }
    return input
}

print("Please enter the upper-right coordinates of the rectangle world")
let recSize = getInput()
print("Rectangle World Size: \(recSize)\n")

print("Please enter the robot position")
let position = getInput()
print("Robot position: \(position)\n")

print("Please enter the robot moving instruction")
let instruction = getInput()
print("Robot moving instruction: \(instruction)\n")
//let recSize = "5 4"
//let position = "0 3 W"
//let instruction = "LLFFFLFLFL"

let recSizeArray = recSize.components(separatedBy: " ")
let positionArray = position.components(separatedBy: " ")
let instructionArray = Array(instruction)
var positionDic = [ String: Int]()

positionDic.updateValue(Int(positionArray[0]) ?? 0, forKey: "x")
positionDic.updateValue(Int(positionArray[1]) ?? 0, forKey: "y")

var rightOrientation = ""
var leftOrientation = ""
var currentOrientation = positionArray[2]

main()

var output = "\(String(describing: positionDic["x"]!)) \(String(describing: positionDic["y"]!)) \(currentOrientation)"

if positionDic["x"]! >= Int(recSizeArray[0])! || positionDic["y"]! >= Int(recSizeArray[1])!{
    output = output + " LOST"
}
print("output: \(output)")

func getRightOrientation(current: String)-> String {
    switch current {
        case "N":
            return "E"
        case "S":
            return "W"
        case "E":
            return "S"
        case "W":
            return "N"
        default:
            return ""
    }
}

func getLeftOrientation(current: String)-> String {
    switch current {
        case "N":
            return "W"
        case "S":
            return "E"
        case "E":
            return "N"
        case "W":
            return "S"
        default:
            return ""
    }
}

func moving(currentOrientation: String, coordination: [String: Int]) {
    switch currentOrientation {
    case "N":
        positionDic.updateValue((coordination["y"] ?? 0) + 1, forKey: "y")
    case "S":
        positionDic.updateValue((coordination["y"] ?? 0) - 1, forKey: "y")
    case "E":
        positionDic.updateValue((coordination["x"] ?? 0) + 1, forKey: "x")
    case "W":
        positionDic.updateValue((coordination["x"] ?? 0) - 1, forKey: "x")
    default:
        break
    }
}

func main() {
    for inst in instructionArray {
        switch inst {
        case "R":
            currentOrientation = getRightOrientation(current: currentOrientation)
        case "L":
            currentOrientation = getLeftOrientation(current: currentOrientation)
        case "F":
            moving(currentOrientation: currentOrientation, coordination: positionDic)
        default:
            break
        }
    }
}
