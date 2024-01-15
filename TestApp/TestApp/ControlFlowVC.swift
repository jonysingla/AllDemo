//
//  ControlFlowVC.swift
//  TestApp
//
//  Created by Jony on 07/12/23.
//

import UIKit

class ControlFlowVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example 1 -- Fallthourgh
                let integerToDescribe = 5
                var description = "The number \(integerToDescribe) is"
                switch integerToDescribe {
                case 2, 3, 5, 7, 11, 13, 17, 19:
                    description += " a prime number, and also"
                    fallthrough
                default:
                    description += " an integer."
                }
                print(description)
                
//                 Without fallthrough
//                The number 5 is a prime number, and also
//                The number 5 is a prime number, and also an integer.
        
        
        // Example 2 -- While
        
        //        var number = 1
        //        while number <= 8{
        //           print(number)
        //           number = number + 1
        //        }
        
        // Example 3 -- Repeat While
        
        var number = 1, n = 10
        //        print("Numbers:")
        repeat
        {
            // Statement
            //            print(number)
            number = number + 1
            
        } while (number <= n)
                    
                    // Example Labeled Statement using break
                    outerLoop: for i in 1...3 {
        innerLoop: for j in 1...3 {
            if j == 2 {
                break outerLoop // Breaks out of the outer loop when j is 2
            }
            //            print("i: \(i), j: \(j)")
        }
        }
        
        // Example 4 -- Labeled Statement using continue
    outerLoop: for i in 1...3 {
    innerLoop: for j in 1...3 {
        if j == 2 {
            continue outerLoop                      // Skips to the next iteration of the outer loop when j is 2
        }
        //            print("i: \(i), j: \(j)")
    }
    }
        
        // Example 5 -- Deffered action
        var scoreOne = 1
        if scoreOne < 10 {
            defer {
                print(scoreOne)
            }
            scoreOne += 5
        }
        
        var scoreTwo = 3
        if scoreTwo < 100 {
            scoreTwo += 100
            defer {
                scoreTwo -= 100
                print("Score Defer",scoreTwo)
            }
            // Other code that uses the score with its bonus goes here.
            print("Score without defer",scoreTwo)
        }
        
        var scoreThree = 3
        if scoreThree < 10 {
            defer {
                print(scoreThree)
            }
            defer {
                print("The score is:")
            }
            scoreThree += 5
        }
        
    }
}
