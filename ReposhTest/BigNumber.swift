//
//  BigNumber.swift
//  ReposhTest
//
//  Created by Mikhail Koroteev on 26.08.17.
//  Copyright © 2017 Mikhail Koroteev. All rights reserved.
//

import Foundation

import UIKit
import Foundation

struct BigInt {
    
    var value: String
    
    func multiply(right: BigInt) -> BigInt {
        var leftCharacterArray = value.characters.reversed().map { Int(String($0))! }
        var rightCharacterArray = right.value.characters.reversed().map { Int(String($0))! }
        var result = [Int](repeating: 0, count: leftCharacterArray.count+rightCharacterArray.count)
        
        for leftIndex in 0..<leftCharacterArray.count {
            for rightIndex in 0..<rightCharacterArray.count {
                
                let resultIndex = leftIndex + rightIndex
                
                result[resultIndex] = leftCharacterArray[leftIndex] * rightCharacterArray[rightIndex] + (resultIndex >= result.count ? 0 : result[resultIndex])
                if result[resultIndex] > 9 {
                    result[resultIndex + 1] = (result[resultIndex] / 10) + (resultIndex+1 >= result.count ? 0 : result[resultIndex + 1])
                    result[resultIndex] -= (result[resultIndex] / 10) * 10
                }
                
            }
            
        }
        
        result = Array(result.reversed())
        return  BigInt(value: result.map { String($0) }.joined(separator: ""))
    }
    
}

func * (left: BigInt, right: BigInt) -> BigInt { return left.multiply(right: right) }
