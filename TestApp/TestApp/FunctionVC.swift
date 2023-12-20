//
//  FunctionVC.swift
//  TestApp
//
//  Created by Jony on 08/12/23.
//

import UIKit

class FunctionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
     // Example 1 -- Function without parameter and return type
        func sayHelloWorld()  {
//            print("Function without parameter and return type")
        }
        
        // Example 2 -- Function without parameter, with return value
        func sayHelloWorld() -> String {
//            print("Function without parameter, return value contain")
                  return "hello, world"
        }

        // Example 3 -- Function with parameter, return value contain -- Defining and Calling Functions
        func greet(person: String) -> String {
            let greeting = "Hello, " + person + "!"
            return greeting
        }
//        print(greet(person: "Dove"))
        // Prints "Hello, Dave!"
        
        // Example 4 -- Function with multiple parameter
        func greet(person: String, alreadyGreeted: Bool) -> String {
            return greet(person: person)
        }
//        print(greet(person: "Tim", alreadyGreeted: true))
        // Prints "Hello again, Tim!"
        
        // Example 5 -- Return value ignored
        func printWithoutCounting(string: String) {
//            print("string", string)
            let test = greet(person: string)
            
        }
//        print(printWithoutCounting(string: "hello"))
        
        // Example 6 -- Function with multiple return type (Tuple)
        func calculateResult() -> (min:Int, max:Int, sum:Int) {
                let min = 10
                let max = 20
                let sum = min + max
//                print(sum)
                return (min, max, sum)
        }
//        print(calculateResult())
        
        // Example 7 -- Optional tuple with return types
        func calculateResultOptional() -> (min:Int, max:Int, sum:Int)? {
                let min = 10
                let max = 20
                let sum = min + max
//                print(sum)
                return (min, max, sum)
        }
//        print(calculateResultOptional() ?? 0)
        
        // Example 8 -- Functions With an Implicit Return
        func greeting(for person: String) -> String {
            "Hello, " + person + "!"
        }
//        print(greeting(for: "Dave"))
        // Prints "Hello, Dave!"

        func anotherGreeting(for person: String) -> String {
            return "Hello, " + person + "!"
        }
//        print(anotherGreeting(for: "Dave"))
        // Prints "Hello, Dave!"
        
        //Example 9 -- Function Argument Labels and Parameter Names
        func argumentLabelWithParameterName(argumentName paramterName: String, argumentFrom parameterCity: String) -> String {
               return ("Hello \(paramterName) which city you are \(parameterCity)")
       }
//       print(argumentLabelWithParameterName(argumentName: "Jony", argumentFrom: "Tohana"))

        // Example 10 -- Specifying Argument Labels
        func someFunction(argumentLabel parameterName: Int) {
            // In the function body, parameterName refers to the argument value
            // for that parameter.
        }
        
        // Example 11 -- Omitting Argument Labels
        func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
        }
        someFunction(1, secondParameterName: 2)
        
        // Example 12 -- Default Parameter Values
        func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {

        }
        someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
        someFunction(parameterWithoutDefault: 4)
        
        // Example 13 -- Variadic Parameter
        func arithmeticMean(_ numbers: Double...) -> Double {
            var total: Double = 0
            for number in numbers {
                total += number
            }
            return total / Double(numbers.count)
        }
        arithmeticMean(1, 2, 3, 4, 5,343,34343,4343,4343)
        
        // Example 14 -- In-Out Parameters
        func swapValues(_ a: inout Int, _ b: inout Int) {
            let temp = a
            a = b
            b = temp
        }
        var number1 = 5
        var number2 = 10

        print("Before swapping: number1 = \(number1), number2 = \(number2)")
        // Using inout parameters to swap values
        swapValues(&number1, &number2)
        print("After swapping: number1 = \(number1), number2 = \(number2)")
        
        // Example 15 -- Function Type
        func addTwoInts(_ a: Int, _ b: Int) -> Int {
            return a + b
        }
        func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
            return a * b
        }
        
        // Example 16 -- Using Function Types
        var mathFunction: (Int, Int) -> Int = addTwoInts
        print("Result: \(mathFunction(2, 3))")
        // Prints "Result: 5"
        
        // Example 17 -- Function type as a parameter types
        func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
            print("Result: \(mathFunction(a, b))")
        }
        printMathResult(addTwoInts, 3, 5)
        // Prints "Result: 8"
        
        // Example 18 -- Function Types as Return Types
        func stepForward(_ input: Int) -> Int {
            return input + 1
        }
        func stepBackward(_ input: Int) -> Int {
            return input - 1
        }
        
        func chooseStepFunction(backward: Bool) -> (Int) -> Int {
            return backward ? stepBackward : stepForward
        }
        
        // Example 19 -- Nested Function
        func outerFunction() {
            print("This is the outer function.")
            // Nested function
            func innerFunction() {
                print("This is the inner function.")
            }
            // Calling the nested function
            innerFunction()
        }
        // Calling the outer function
        outerFunction()

        
    }
    
}
