//
//  OptionalProtocolVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
// https://betterprogramming.pub/how-to-add-optional-methods-in-swift-protocols-91f00007cfd0

import UIKit

class OptionalProtocolVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //MARK: Optional protocol with extension in struct
        // Create an instance of MyStruct
        let myStruct = MyStructOptional()

        // Call the method
        myStruct.myOptionalFunction() // Output: Default implementation of myOptionalFunction
    }
}
//MARK: With Optional protocol in class
@objc protocol MyOptionalProtocol {
    @objc optional func optionalMethod()
    @objc optional var optionalProperty: String { get }
}

class MyClassOptionalProtocol: MyOptionalProtocol {
    // Implementing optionalMethod is optional for conforming types
    func optionalMethod() {
        print("Implemented optionalMethod in MyClass")
    }

    // Implementing optionalProperty is also optional
    var optionalProperty: String {
        return "Implemented optionalProperty in MyClass"
    }
}


//MARK: Optional protocol with extension in struct
// Define a protocol
protocol MyProtocolOptional {
    func myOptionalFunction()
    func myOptionalFunctionTwo()
}

// Provide a default implementation using a protocol extension
extension MyProtocolOptional {
    func myOptionalFunction() {
        print("Default implementation of myOptionalFunction")
    }
}

// Conform to the protocol in your struct , It means by using extension my protocol is optional but this is not good practice, we can also create sepearate protocol for this.
struct MyStructOptional: MyProtocolOptional {
    func myOptionalFunctionTwo() {
        print()
    }
    
    // You don't need to implement myOptionalFunction here
}

//MARK: Can we use optional protocol in struct?
/*
// Error
 @objc protocol TestProtocol {
     @objc optional func addtionTwoNumer ()
 }

 struct TestOneTwo  {
 }

 extension TestOneTwo : TestProtocol {
     func addtionTwoNumer() {
     }
 }
*/

/*
 // Error
// Second way to achieve this, but no solution
@objc protocol TestProtocol {
    @objc optional func addtionTwoNumer ()
}

extension TestProtocol  {
    func addtionTwoNumer() {
    }
}

struct TestOneTwo : TestProtocol  {
}
*/
