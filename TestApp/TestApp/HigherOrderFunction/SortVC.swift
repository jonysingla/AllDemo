//
//  SortVC.swift
//  TestApp
//
//  Created by Jony on 06/02/24.
//

import UIKit

class SortVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //MARK: Find second largest number in the array
        
        var arrayWithoutSort = [12,54,45,234,43,30]
        // Step 1 Sort array
        for indexi in 0..<arrayWithoutSort.count {
            for indexj in 0..<arrayWithoutSort.count - 1 {
                if arrayWithoutSort[indexj] > arrayWithoutSort[indexj+1] {      // 12>54, 54>45, 54>234
                    let temp = arrayWithoutSort[indexj]                         // --, 54, -
                    arrayWithoutSort[indexj] = arrayWithoutSort[indexj+1]       // --,45, -
                    arrayWithoutSort[indexj+1] = temp                           // --, 54, -
                }
            }
        }
        print(arrayWithoutSort)
        // Step 1 Get second elements in this array
        print(arrayWithoutSort[1])
        
        // With higher order function
        var arrayWithout = [12,54,45,234,43,30]
        var sortedArray = arrayWithout.sorted()
        print(sortedArray)
        print(sortedArray[1])
        
        //MARK: Repeated word and count in string.
        var objString = "The iPhone is a line of smartphones designed and marketed by Apple Inc."
    }
}
