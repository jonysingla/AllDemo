//
//  RangeOperatorViewController.swift
//  TestApp
//
//  Created by Jony on 04/12/23.
//

import UIKit

class RangeOperatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Example 1 -- Closed Range Operatorin page link
         for index in 5...5 {
             print(index)
 //            print("\(index) times 5 is \(index * 5)")
         }
         
         // Example 3 -- Half Close Range Operatorin page link
         for index in 1..<5 {
 //            print("\(index) times 5 is \(index * 5)")
         }
         
         let names = ["Anna", "Alex", "Brian", "Jack"]
         let count = names.count
         for i in 0..<count {
//             print("Person \(i + 1) is called \(names[i])")
         }
         
         // Example 3 -- One side range operator
         for name in names[2...] {
//             print("One Side ", name)
         }
         
         for name in names[...2] {
//             print("One Side", name)
         }
    }


}

