//
//  stringSolver.swift
//  MathVision
//
//  Created by Austin Whitney on 2019-03-29.
//  Copyright © 2019 maximpuchkov. All rights reserved.
//
import Foundation
func solve(formula: String, input: Float) -> NSNumber {
    let letterset = CharacterSet.letters
    let numberset = CharacterSet.decimalDigits
    var newformula = formula
    for index in newformula.indices{
        print(newformula)
        if letterset.contains(newformula.unicodeScalars[index]) {
            if(index > newformula.startIndex){
                if numberset.contains(newformula.unicodeScalars[newformula.index(before: index)]) {
                    newformula.remove(at: index)
                    newformula.insert(contentsOf: String(input), at: index)
                    newformula.insert("*", at: index)
                    return solve(formula: newformula, input: input)
                }
                else {
                    newformula.remove(at: index)
                    newformula.insert(contentsOf: String(input), at: index)
                    return solve(formula: newformula, input: input)
                }
            }
            else{
                newformula.remove(at: index)
                newformula.insert(contentsOf: String(input), at: index)
                return solve(formula: newformula, input: input)
            }
            
        }
    }
    let mathExpression = NSExpression(format: newformula)
    return (mathExpression.expressionValue(with: nil, context: nil) as? NSNumber)!
}

func solveAll(OCRinput: String, input: Float) -> [String] {
    var resultarray = [String]()
    var temp = ""
    var newtemp = ""
    var flag = 0
    for index in OCRinput.indices {
        if(OCRinput[index] == "\n"){
            temp = temp.replacingOccurrences(of: " ", with: "")
            newtemp = "y = " + temp + " = " + String(solve(formula: temp, input: input).doubleValue) + " when x = " + String(input)
            resultarray.append(newtemp)
            temp = ""
            flag = 0
        }
        if(OCRinput[index] == "="){
            flag = 1
            continue
        }
        if(flag == 1){
            temp = temp + String(OCRinput[index])
        }
        
    }
    return resultarray
}
