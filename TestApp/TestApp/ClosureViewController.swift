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
        
        //MARK: Closure expression
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

        // First way
//        func backward(_ s1: String, _ s2: String) -> Bool {
//            return s1 > s2
//        }
//        var reversedNames = names.sorted(by: backward)
//
//        // Second way
//        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
//            return s1 > s2
//        })
//
//        reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
//
//        // Third way
//        reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
//
//        // Fourth way
//        reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
//
//        // fifth way
//        reversedNames = names.sorted(by: { $0 > $1 } )
        
        // Sixth way
        var reversedNames = names.sorted(by: <)
        print ("reversedNames", reversedNames)
        


        // Do any additional setup after loading the view.
        
        //MARK: Syntax of Clsoure -- Closure Expression Syntax
//        { (params) -> Return Type in
            // Closure body
                // Perform some operations and return a value (if required)
//        }
        
        // Example 1 -- MARK: Simple Closure
        let simpleClosure = {
        }
        simpleClosure()
        
        // Example 1.1 Simple Closure without parameter with return type String
         var obj: () -> String
         // Assign a closure to the variable
         obj = {
         return "Hello, World!"
         }
         // Call the closure through the variable
         let result = obj()
         print(result)  // Output: Hello, World!
        
        // Example 2 -- MARK: Closure with parameter as String, Return type Void with "in"
        let closureWithParameter: (String) -> Void = { _ in
            print("Closure with Parameter")
        }
        closureWithParameter("Hello")
        
        // Example 3 --MARK: Closure without parameter, Return type Void without "in"
        let closureWithOutParameter: () -> Void = {
            print("Closure without Parameter")
        }
        closureWithOutParameter()
        
        // Example 4 --MARK: Closure with parameter as String, Return type String with "in"
        let closureWithReturnParameter: (String) -> String = { name in
            print("Closure with Return Parameter")
            return name
        }
        closureWithParameter("Good")
        
        // Example 5 --MARK: Closure with Two parameter as String, Return type String with "in"
        let closureWithReturnTwoParameter: (String, String) -> String = { firstName, lastName  in
            print("Closure with Return Two Parameter", firstName + " " + lastName)
            return firstName + lastName
        }
        closureWithReturnTwoParameter("Jony", "Singla")
        
        // Example 6 --MARK: Global Function
        func globalFunction() {
            print("Hello, world!, It's a GLobal function!")
        }
        globalFunction()
        
        // Example 7 --MARK: Global Closure without capture value
        let closureWithoutCapture:() -> Void = {
            let name = "Great"
            print("Hello, \\(name)!")
        }
        closureWithoutCapture()
        
        // Example 8 --MARK: Global Closure with capture value
        let name = "Wow"
        let closureWithCapture: () -> Void = {
            print("Hello, \\(name)!")
        }
        closureWithCapture()

        // Example 9 --MARK: Global Function with closure ------------- Doubt
        let greetingClosure: (String) -> Void = { name in
            print("Hello, \(name)!")
        }
        
        // Example 10 --MARK: Passing closure as a function parameter
        func closureFunctionParameter(message: String, someClousre:()->()) {
            print("Function Called", message)
            someClousre()
            print("Function Called End", message)
        }
        closureFunctionParameter(message: "Hello", someClousre: {
          print("Hello World! from closure")
        })
        
        // Example 11 --MARK: Single Trailing Closure  -- Means we are not calling someClosure() function in function parameter and passing only ()
        func trailingClosure(message: String, someClosure:()-> ()) {
            print("Hi ", message)
            someClosure()
        }
        
        // Calling without trailing closure
        trailingClosure(message: "Hello", someClosure: {
            print("Hello World! without trailing closure")
        })
        
        
        // Calling with Single trailing Closure
        trailingClosure(message: "Hi") {             // here we are not calling someClosure() as final argument that is trailing closure
            print("Hello World! from closure")
        }
        
        // Example 12 --MARK: Multiple trailing Closure
        func multipleTrailingClosure(message : String, success:()->(), failure: ()->()) {
            print("Message -- ", message)
            success()
            failure()
        }
        
        //Calling without trailing Multiple closure
        multipleTrailingClosure(message: "Testing 1", success: {
            print("Success")
        }, failure: {
            print("Failure")
        })
        
        //Calling with trailing Multiple closure
        multipleTrailingClosure(message: "Testing") {
            print("Success")
        } failure: {
            print("Failure")
        }

        // Example 13 --MARK: Capture Value -- It's reference type to override value
        var str = "Hello, World!"
        var value = "iOS"
        var myClosureCapture = {
            print("str", str)
            print("value", value)
        }
        str = "next"
        value = "Android"
        myClosureCapture()
        
        // Example 14 --MARK: Capture List []       -- to overcome capture value problem we can used capture list.
        var strCaptureList = "Hello, World!"
        var valueList = "iOS"
        var myClosureCaptureList = { [strCaptureList, valueList] in
            print("strCaptureList", strCaptureList)
            print("valueList", valueList)
        }
        strCaptureList = "next"
        valueList = "Android"
        myClosureCaptureList()
        
        
       // Example 15 --MARK: Clousre are reference type -- Example 13 working for same
   
        
        // Example 16 --MARK: No Escaping Closure
        func doSomething(completion: () -> Void) {
            // The closure is guaranteed to be executed within this function
            completion()
        }

        // Calling no-escaping closure
        doSomething {
            print("Doing something")
        }
        
        // Example 17 --MARK: Escaping Closure
        func performOperation(completion: @escaping () -> Void) {
            // Storing the closure for later execution
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                completion()
            }
        }
        //Calling an escaping closure
        performOperation {
            print("Operation completed")
        }
    

        // Example 18 --MARK: Without Autoclosure
        func someFunction(shouldExecuteClosure: () -> Bool) {
            if shouldExecuteClosure() {
                print("Closure executed!")
            } else {
                print("Closure not executed!")
            }
        }

//        someFunction(shouldExecuteClosure: true)                      // Error -- Cannot convert value of type 'Bool' to expected argument type '() -> Bool'

        // Example 19 --MARK: With Autoclosure
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
