//
//  ClosureViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class ClosureViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Syntax of Clsoure -- Closure Expression Syntax
//        { (params) -> Return Type in
            // Closure body
                // Perform some operations and return a value (if required)
//        }
        
        // Example 1 -- Simple Closure
        let simpleClosure = {
        }
        simpleClosure()
        
        // Example 2 -- Closure with parameter as String, Return type Void with "in"
        let closureWithParameter: (String) -> Void = { _ in
            print("Closure with Parameter")
        }
        closureWithParameter("Hello")
        
        // Example 3 -- Closure without parameter, Return type Void without "in"
        let closureWithOutParameter: () -> Void = {
            print("Closure without Parameter")
        }
        closureWithOutParameter()
        
        // Example 4 -- Closure with parameter as String, Return type String with "in"
        let closureWithReturnParameter: (String) -> String = { name in
            print("Closure with Return Parameter")
            return name
        }
        closureWithParameter("Good")
        
        // Example 5 -- Closure with Two parameter as String, Return type String with "in"
        let closureWithReturnTwoParameter: (String, String) -> String = { firstName, lastName  in
            print("Closure with Return Two Parameter", firstName + " " + lastName)
            return firstName + lastName
        }
        closureWithReturnTwoParameter("Jony", "Singla")
        
        // Example 6 -- Global Function
        func globalFunction() {
            print("Hello, world!, It's a GLobal function!")
        }
        globalFunction()
        
        // Example 7 -- Global Closure without capture value
        let closureWithoutCapture: () -> Void = {
            let name = "Great"
            print("Hello, \\(name)!")
        }
        closureWithoutCapture()
        
        // Example 8 -- Global Closure with capture value
        let name = "Wow"
        let closureWithCapture: () -> Void = {
            print("Hello, \\(name)!")
        }
        closureWithCapture()

        // Example 9 -- Global Function with closure
        let greetingClosure: (String) -> Void = { name in
            print("Hello, \(name)!")
        }
        
        // Example 10 -- Passing closure as a function parameter
        func closureFunctionParameter(someClousre:()->()) {
            print("Function Called")
            someClousre()
        }
        closureFunctionParameter(someClousre: {
          print("Hello World! from closure")
        })
        
        // Example 11 -- Trailing Closure  -- Means we are not calling someClosure() function in function parameter and passing only ()
        func trailingClosure(someClosure:()-> ()) {
            print("Hi ")
            someClosure()
        }
        trailingClosure() {             // here we are not calling someClosure() as final argument that is trailing closure
            print("Hello World! from closure")
        }
        
        // Example 12 -- Capture Value
        func makeIncrementer(incrementAmount: Int) -> () -> Int {
            var total = 0
            let incrementer: () -> Int = {
                total += incrementAmount
                return total
            }
            return incrementer
        }

        // Create an incrementer that increments by 5
        let incrementBy5 = makeIncrementer(incrementAmount: 5)

        // Call the closure multiple times
        print(incrementBy5())  // Prints 5
        print(incrementBy5())  // Prints 10
        print(incrementBy5())  // Prints 15

       // Example 13 -- Clousre are reference type
        let myClosure: () -> Void = {
            print("Hello, closure!")
        }
        // Create a reference to the closure
        let anotherReference = myClosure
        // Call the closure using one reference
        myClosure()         // Prints "Hello, closure!"
        // Call the closure using another reference
        anotherReference()  // Also prints "Hello, closure!"
        
        // Example 14 -- Escaping Closure
        func performOperation(completion: @escaping () -> Void) {
            // Storing the closure for later execution
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completion()
            }
        }
        // Using an escaping closure
        performOperation {
            print("Operation completed")
        }
        
        // Example 14 -- No Escaping Closure
        func doSomething(completion: () -> Void) {
            // The closure is guaranteed to be executed within this function
            completion()
        }

        // Using a non-escaping closure
        doSomething {
            print("Doing something")
        }

        // Example 15 -- Without Autoclosure
        func someFunction(shouldExecuteClosure: () -> Bool) {
            if shouldExecuteClosure() {
                print("Closure executed!")
            } else {
                print("Closure not executed!")
            }
        }

        // Without autoclosure
//        someFunction(shouldExecuteClosure: true) // Error -- Cannot convert value of type 'Bool' to expected argument type '() -> Bool'

        // Example 16 -- With Autoclosure
        func someFunctionWith(shouldExecuteClosure: @autoclosure() -> Bool) {
            if shouldExecuteClosure() {
                print("Closure executed!")
            } else {
                print("Closure not executed!")
            }
        }

        // Using autoclosure
        someFunctionWith(shouldExecuteClosure: true)

                
    }
}
