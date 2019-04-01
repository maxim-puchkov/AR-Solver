//
//  stringSolver.swift
//  MathVision
//
//  Created by Austin Whitney on 2019-03-29.
//  Copyright © 2019 maximpuchkov. All rights reserved.
//

import Foundation

func solve(formula: String, input: Int) -> Int {
    let letterset = CharacterSet.letters
    let numberset = CharacterSet.decimalDigits
    var newformula = formula
    for index in newformula.indices{
        if letterset.contains(newformula.unicodeScalars[index]) {
            if(index > newformula.startIndex){
                if numberset.contains(newformula.unicodeScalars[newformula.index(before: index)]) {
                    newformula.insert("*", at: newformula.index(before: index))
                    newformula.remove(at: index)
                }
            }
            newformula = newformula.replacingOccurrences(of: String(newformula[index]), with: String(input))
        }
    }
    let mathExpression = NSExpression(format: newformula)
    return (mathExpression.expressionValue(with: nil, context: nil) as? Int)!
}
