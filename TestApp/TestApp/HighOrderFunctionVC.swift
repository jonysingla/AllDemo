//
//  HighOrderFunctionVC.swift
//  TestApp
//
//  Created by Jony on 11/12/23.
//

import UIKit

class HighOrderFunctionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Example 1 -- Map function
        var wordsArray = ["hi","hello","how"]
        let upperCase = wordsArray.map({ words in
            return words.uppercased()
        })
        print("wordsArray", upperCase)
        
        // Example 2 -- Compacy Map
        var mapArray = ["hi","hello","how",nil]
        let compactMapArray = mapArray.compactMap({ compact in
            return compact?.uppercased()
        })
        print("compactMapArray", compactMapArray)
        
        // Example 3 -- Flat Map
        var mapArrayFlat = [["hi"],["hello","how"],[nil],["good", "what"]]
        let flatMapArray = mapArrayFlat.flatMap({$0})
        print("flatMapArray -- ",flatMapArray)
        
        let numbers = [[1,2,3],[4],[8,9,920,5,6,7,8,9]]
        let flattened = numbers.flatMap { $0 }
        print("flattened -- ",flattened)
        
        // Example 4 -- Reudce Map
        let numbersArray = [1,2,3,4,8,9,920,5,6,7,8,9]
        let reduceArray = numbersArray.reduce(0,{ x,y in
            return x + y
        })
        print("reduceArray", reduceArray)
        
        // Example 5 -- Filter array & contain array
        var arrayFilter = ["hi","hello","how"]
        let filterArray = arrayFilter.filter{ $0.contains("o")}
        print("filterArray",filterArray)
        
        // Example 6 -- Sorted Array
        let numbersArraySorted = [1,2,3,4,8,9,920,5,6,7,8,9]
        let sortedArray = numbersArraySorted.sorted()
        print("sortedArray", sortedArray)
        
        // Example 7 -- Remove all
        var numbersRemove = [1,2,3,4,8,9,920,5,6,7,8,9]
        numbersRemove.removeAll {$0 % 2 == 0}
        print("removeAllNumber", numbersRemove)
        
    }
}
