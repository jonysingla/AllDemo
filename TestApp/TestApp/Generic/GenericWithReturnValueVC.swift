//
//  GenericWithReturnValueVC.swift
//  TestApp
//
//  Created by Jony on 19/01/24.
//

import UIKit

class GenericWithReturnValueVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Example 2 Generic with return generic value
        let intValue = identity(42)
        let stringValue = identity("Hello, Swift!")
        
        print(intValue)
        print(stringValue)
        
        //Example 21 Generic with return generic class
        let intBox = Box(value: 42)
        let stringBox = Box(value: "Boxed String")

        print(intBox.value)      // Output: 42
        print(stringBox.value)   // Output: Boxed String
        
        // Example 3: Multiple type parameter with function
        let result = swapValues(42, "Hello")
        print(result)  // Output: ("Hello", 42)
        
        // Example 3.1: Multiple type parameter with class
        let pair = Pair(first: 42, second: "Hello")
        print(pair.first)   // Output: 42
        print(pair.second)  // Output: Hello
        
    }
    

    //MARK: 2.1 Generic with return Generic Value
    func identity<T>(_ value: T) -> T {
        return value
    }
    
    //MARK: 3 Generic Multiple type parameter with function return value
    // Generic function with two type parameters
    func swapValues<T, U>(_ a: T, _ b: U) -> (U, T) {
        return (b, a)
    }
}
//MARK: 2.1 Generic with return class Generic
class Box<T> {
    var value: T

    init(value: T) {
        self.value = value
    }
}

//MARK: 3.1 Multiple type parameter with class
class Pair<T, U> {
    var first: T
    var second: U

    init(first: T, second: U) {
        self.first = first
        self.second = second
    }
}
