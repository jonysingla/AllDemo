//
//  HigherOrderFunctionVC.swift
//  TestApp
//
//  Created by Jony on 06/02/24.
//

import UIKit

class HigherOrderFunctionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: 1 Map
        let words = ["hi","hello","ram","how","are","you","good"]
        let upperCased =  words.map({ word in
//            return word.uppercased()
            return word.capitalized
        })
        print("upperCased", upperCased)
        
        //MARK: 2 Compact Map
        var wordsCompact = ["hi","hello","trst","how","good",nil, nil, "you","good"]
        let upperCasedCompact =  wordsCompact.compactMap({ word in
//            return wordsCompact.uppercased()
            return word?.capitalized
        })
        print("upperCasedCompact", upperCasedCompact)
        
        // Without Compact Map
        var index = 0
        while index < wordsCompact.count {
            if wordsCompact[index] == nil {
                wordsCompact.remove(at: index)
            } else {
                index += 1
            }
        }
        print(words)
        
        //MARK: 3 Flat Map
        let arrayFlat  = [["hi","hello"],["there","how"],["good"],["you","good"]]
        let flatArray = arrayFlat.flatMap({$0})
        print("flatArray",flatArray)
        
        //MARK: 4 Reduce
        var numbers : [Int] = [1,2,3,4,5,6,7,8]
        let sum = numbers.reduce(0, { x,y in
            return x + y
        })
        print("sum ",sum)
        
        //MARK: 5 Filter
        var comactWithoutNil = wordsCompact.filter{$0 != nil}.map{$0!}
        print(comactWithoutNil)
        
        //MARK: 6 Contains
        let wordsContain = ["hi","hello","ram","how","are","you","good"]
        var newWords = wordsContain.filter({$0.contains("o")})
        print("newWords  ", newWords)
        
        //MARK: 7 Sorted
        let wordsSort = ["hi","hello","ram","how","are","you","good"]
        var sorted = wordsSort.sorted()
        print("Words sorted", sorted)
        
        //MARK: 8 Remove all
        var numbersContain : [Int] = [2,3,343,54,54,65,232]
        numbersContain.removeAll(where: {$0 % 2 == 0})
        print("numbers Contain", numbersContain)

        
        //MARK: 9 Compact Map Value
        let people = [
            "Sumit" : 28,
            "Vishal": 24,
            "Test": 43,
            "Blank": nil
        ]
        
        let knownAges = people.compactMapValues({$0})
        print("known Ages", knownAges)

    }
}
