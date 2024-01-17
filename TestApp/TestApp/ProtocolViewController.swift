//
//  ProtocolViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class ProtocolViewController: UIViewController /*, SomeProtocol, PropertyProtocol*/ {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Example 1: Property Requirements only getter calling
        struct Person: FullyNamed {
            var fullName: String
        }
        var john = Person(fullName: "John Appleseed")
        john.fullName = "Jony"                          // Here we are set value
        

        //Example 1.1: Property Requirements getter and setter with class and struct
        var myStructInstance = MyStruct()
        myStructInstance.myProperty = 42        // set value
        print(myStructInstance.myProperty)  // Prints 42        // get value

        var myClassInstance = MyClassProtocol()
        myClassInstance.myProperty = 99                     // set value
        print(myClassInstance.myProperty)  // Prints 99     // get value
        
        //Example 2.1: Method requirement with method body
        let addition = LinearCongruentialGenerator()
        print("Here's a addtiton of number: \(addition.addition())")
        
        //Example 3: Mutating Method Requirements calling
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()
        
        //Example 4: Initializer Requirements mention below
        
        
        
        
//        let objViewController = ProtocolViewController()
//        objViewController.SubTractionInteger()
                
    }
    
}

//MARK: 1 Property Requirements only getter
protocol FullyNamed {
//    var fullName: String          //Error Property in protocol must have explicit { get } or { get set } specifier
    var fullName: String { get }
}

//MARK: 1.1 Property Requirements getter and setter with class and struct
protocol MyProtocol {
    var myProperty: Int { get set }
}

struct MyStruct: MyProtocol {
    var myProperty: Int = 0
}

class MyClassProtocol: MyProtocol {
    var myProperty: Int = 0
}

//MARK: 2 Method requirement with type (static)
protocol SomeProtocol {
    static func someTypeMethod()
}

//MARK: 2.1 Method requirement instance method with return value Bool
protocol AdditionNumberGenerator {
    func addition() -> Double
}

// Method implementation
class LinearCongruentialGenerator: AdditionNumberGenerator {
    var valueA = 42.0
    let valueB = 50.0
    func addition() -> Double {
        var valueC = valueA + valueB
        return valueC
    }
}

//MARK: 3 Mutating Method requirements
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
//MARK: 4 Initializer Requirements
protocol SomeProtocolInitializer {
    init(someParameter: Int)
}

//MARK: 4.1 Without required keyword giving error
/*
class SomeClassInitalizatier: SomeProtocolInitializer {
     init(someParameter: Int) {
    // Error without Requierd keyword Initializer requirement 'init(someParameter:)' can only be satisfied by a 'required' initializer in non-final class 'SomeClassInitalizatier'
    
        // initializer implementation goes here
    
}*/

//MARK: 4.2 With final keyword no error but class can't override
/*final class SomeClassInitalizatier: SomeProtocolInitializer {
     init(someParameter: Int) {
        // initializer implementation goes here
}*/

//MARK: 4.2 With required keyword
class SomeClassInitalizatier: SomeProtocolInitializer {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}
    
    
/*
//MARK: Protocol Syntax or Method Protocol
@objc protocol SomeProtocol {
    @objc optional func additionInteger()
    
}
//MARK: Protocol Extension
extension SomeProtocol {
    func SubTractionInteger() {
        print("Default implementation of doSomething")
    }
}
//MARK: Property Protocol
@objc protocol PropertyProtocol {
    @objc optional var objA : String {get set}
    @objc optional var objB : String {get set }
}

//MARK: Method Protocol
protocol Togglable {
    mutating func toggle()
}

//MARK: Initializer Requirement
protocol initaliZeProtocol{
    init(someParameter: Int)
}
*/
