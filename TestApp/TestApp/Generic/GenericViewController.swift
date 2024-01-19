//
//  GenericViewController.swift
//  TestApp
//
//  Created by Jony on 11/12/23.
//

import UIKit

class GenericViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Example 1: Without Generic swap int
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        
        // Example 2: With Generic swap any value
//        swapTwoValues(&10, &20)       //Error Can't pass direct value to function -- Cannot pass immutable value as inout argument: literals are not mutable
        swapTwoValues(&someInt, &anotherInt)
        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, &anotherString)
        print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        print("someString is now \(someString), and anotherString is now \(anotherString)")
        
    }
    
    //MARK: 1 Without Generic swap int
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    //MARK: 1.1 Without Generic swap String
    func swapTwoStrings(_ a: inout String, _ b: inout String) {
        let temporaryA = a
        a = b
        b = temporaryA
    }

    //MARK: 1.2 Without Generic swap Double
    func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    //MARK: 2 With Generic
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
}
