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
