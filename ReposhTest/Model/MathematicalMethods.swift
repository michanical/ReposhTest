//
//  MathematicalMethods.swift
//  ReposhTest
//
//  Created by Mikhail Koroteev on 26.08.17.
//  Copyright © 2017 Mikhail Koroteev. All rights reserved.
//

import Foundation

class MathematicalMethods {
    
    func findPrimeNumberBySieveOfEratosthenes(number: Int) -> [Int] {
        var bitArray = Array(repeating: true, count: Int(number+1))
        var i = 2
        while i*i < number {
            if bitArray[i] {
                var j = i*i
                while j <= number {
                    bitArray[j] = false
                    print(j)
                    j += i
                }
            }
            print(i)
            i += 1
        }
        return getAllPrimeNumbersFromBooleanArray(booleanArray: bitArray)
    }
    
    func findPrimeNumberBySieveOfAtkin(number: Int) -> [Int] {
        var bitArray = Array(repeating: false, count: Int(number+1))
        var x2 = 0
        var y2 = 0
        bitArray[2] = true
        if number > 2 {
            bitArray[3] = true
        }
        let maxNumber = Int(sqrt(Double(number)))
        var n = 0
        for i in 1...maxNumber {
            x2 += 2*i-1
            y2 = 0
            for j in 1...maxNumber {
                y2 += 2*j-1
                
                n = 4*x2+y2
                if ((n<=number) && ((n%12 == 1) || (n%12 == 5))) { bitArray[n] = !bitArray[n] }
                
                n -= x2
                if ((n<=number) && (n%12 == 7)) { bitArray[n] = !bitArray[n] }
                
                n -= 2*y2
                if ((i>j) && (n<=number) && (n%12 == 11)) { bitArray[n] = !bitArray[n] }
            }
        }
        
        if maxNumber >= 25 {
            for i in 5...maxNumber {
                if bitArray[i] {
                    n = i*i
                    for j in stride(from: n, to: maxNumber, by: n) {
                        bitArray[j] = false
                    }
                }
            }
        }
        
        return getAllPrimeNumbersFromBooleanArray(booleanArray: bitArray)
    }
    
    func getAllPrimeNumbersFromBooleanArray(booleanArray: [Bool]) -> [Int] {
        var primeNumbers = [Int]()
        for i in 2..<booleanArray.count {
            if booleanArray[i] {
                primeNumbers.append(i)
            }
        }
        return primeNumbers
    }
    
    func getSumOfArray(array: [Int]) -> Int {
        return array.reduce(0,+)
    }
    
}
