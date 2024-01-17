//
//  ProtocolViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class ProtocolViewController: UIViewController /*, SomeProtocol, PropertyProtocol*/ {
    
    override func viewDidLoad()  {
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
        
        //Example 5: Opaque type mention in another class
        
        //Example 6: Delegation calling
        let delegator = Delegator()
        let delegateObject = MyDelegateClass()

        // Set the delegate
        delegator.delegate = delegateObject

        // Perform the task, and the delegate will be notified
        delegator.performTask()
        
        //Example 7: Protocol with Extension
        var objExtension = ProtocolExtensinVC()
//        objExtension.addition(objA: 10, objB: 20)
        print("objExtension -- ",objExtension.addition(objA: 20, objB: 30))
        print("objExtension -- ",objExtension.substraction(objA: 40, objB: 35))
        
        //Example 7.1: Protocol with Extension Conditionally conforming
        let structWithInt = MyStructConforming(value: 42)
        let structWithString = MyStructConforming(value: "Hello, World!")

        print(structWithInt.log())       // Prints "Logged: 42"
        print(structWithString.log())   // Prints "Logged: Hello, World!"
        
        //Example 7.2: Protocol Adoption with an Extension
        let simonTheHamster = Hamster(name: "Simon")
        let somethingTextRepresentable: TextRepresentable = simonTheHamster
        print(somethingTextRepresentable.textualDescription)
        
        //Example 8: Equatable Protocol with Struct
        let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
        let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
        if twoThreeFour == anotherTwoThreeFour {
            print("These two vectors are also equivalent.")
        }
        
        //Example 8.1: Equatable Protocol with Class
        let objVector3DOne = Vector3DClass(x: 2, y: 3)
        let objVector3DTwo = Vector3DClass(x: 2, y: 3)
        
        print("Print result ",objVector3DOne == objVector3DTwo)           //Don't understand why given result false below same example give true value
        
        //Example 8.1: Equatable Protocol with Class
        let person1 = PersonEquatableTest(name: "Alice", age: 30)
        let person2 = PersonEquatableTest(name: "Bob", age: 25)
        let person3 = PersonEquatableTest(name: "Alice", age: 30)

        print("Print result -- ",person1 == person2)  // false
        print("Print result -----",person1 == person3)  // true
        
        //Example 9: Hashable Protocol
        let point1 = PointHashable(x: 1, y: 2)
        let point2 = PointHashable(x: 1, y: 2)
        let point3 = PointHashable(x: 3, y: 4)

        print("Without Hashable ",point1)
        print("Without Hashable ",point2)
        print("Without Hashable ",point3)
        
        print("Hashable ",point1.hashValue)  // Hash value for point1
        print("Hashable ",point2.hashValue)  // Hash value for point2
        print("Hashable ",point3.hashValue)
        
        let pointSet: Set<PointHashable> = [point1, point2, point3]
        print(pointSet)
        
        //Example 9.1: Hasher Protocol
        var objHasher = PoinHasher(x: 10, y: 20)
        
        var hasher = Hasher()
        hasher.combine(objHasher)
        let hashValue = hasher.finalize()
        
        print("hashValue ",hashValue)
        
        //Example 10: Comparable Protocol
        var levels = [SkillLevel.intermediate, SkillLevel.beginner,
                      SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
        for level in levels.sorted() {
            print(level)
        }
        
        
        
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

