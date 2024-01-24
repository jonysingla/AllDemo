//
//  ArrayVC.swift
//  TestApp
//
//  Created by Jony on 05/12/23.
//

import UIKit

class ArrayVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var objArrary = ["Hi", "Hello", 1,3,nil] as [Any?]
        print(objArrary)

        // Do any additional setup after loading the view.
        // Example 1: Empty array
        
        var someInts: [Int] = []
//        print("someInts is of type [Int] with \(someInts.count) items.")
        
        someInts.append(3)
//        print("someInts is of type [Int] with \(someInts.count) items.")
        
        //Example 2 -- Creating an Array with a Default Value
        var threeDoubles = Array(repeating: 0.0, count: 3)
//        print("Default value array", threeDoubles)
        
        //Example 3 -- Creating an Array by Adding Two Arrays Together
        var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
        var sixDoubles = threeDoubles + anotherThreeDoubles
//        print("sixDoubles value array", sixDoubles)
        
        //Example 4 -- Creating an Array with an Array Literal
        var shoppingList: [String] = ["Eggs", "Milk"]
//        print("shoppingList", shoppingList)
        
//        var defaultValueArray = ["hello", "Hi", 1] as [Any]
//        print("Literal --- ", defaultValueArray)
        
        //Example 5 -- Accessing and Modifying an Array
//        print("The shopping list contains \(shoppingList.count) items.")
        shoppingList.append("Flour")
        
//        print("The shopping list contains \(shoppingList.count) items.")
        
        // Retrieve a value from the array by using subscript syntax
        var firstItem = shoppingList[0]
//        print("value of index", firstItem)
        
        // use subscript syntax to change an existing value at a given index
        shoppingList[0] = "Six eggs"
//        print("subscript syntax to change an existing value", shoppingList)
        
        // using closed range operator
        shoppingList[1...2] = ["Bananas", "Apples"]
//        print("Add value using closed range operator", shoppingList)
        
        // insert an item into the array at a specified index, call the array’s insert(_:at:)
        shoppingList.insert("Maple Syrup", at: 0)
//        print("Shopping list", shoppingList)
        
        // Iterating Over an Array
        for item in shoppingList {
//            print(item)
        }
        
        // index of each item as well as its value, use the enumerated()
        for (index, value) in shoppingList.enumerated() {
            print("Item \(index + 1): \(value)")
        }
    }

}
