//
// Created by root on 22/03/19.
//

import Foundation

func solve(formula: String, input: Int) -> Int {
    let letters = CharacterSet.letters
    for char in formula {
        if letters.contains(char){
            formula = formula.replacingOccurrences(of: char, with: String(input))
        }
    }
    let mathExpression = NSExpression(format: formula)
    let mathValue = mathExpression.expressionValueWithObject(nil, context: nil) as? Int
}