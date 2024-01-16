//
//  ExtensionViewController.swift
//  TestApp
//
//  Created by Jony on 16/01/24.
//

import UIKit

class ExtensionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Example 1: Source Code available in extension -- Struct extnesion
        let person = PersonExtension(firstName: "John", lastName: "Doe")
        print(person.fullName) // "John Doe"

        person.greet()
        // Prints "Hello, John Doe!"
        
        //Example 2: Source Code available in extension -- Class extension
        let personExtensionClass = PersonExtensionClass(firstName: "John", lastName: "Doe")
        print(personExtensionClass.fullName) // "John Doe"

        personExtensionClass.greet()
        
        //Example 3: Exntesion Syntax mention below
        //Example 4: Extension with Protocol Syntax
        
        //Example 5: Backward compatibiltiy
        // Original definition of the Int type
        let originalNumber: Int = 5
        
        // The new functionality is available on existing instances
        let squaredOriginalNumber = originalNumber.squared // 25
        
        //Example 6: Computed Property
        let oneInch = 25.4.mm
        print("One inch is \(oneInch) meters")
        // Prints "One inch is 0.0254 meters"
        
        //Example 7: Extension Initializers
        let defaultPoint = PointInitializer()
        print(defaultPoint)  // Point(x: 0.0, y: 0.0)

        let customPoint = PointInitializer(value: 5.0)
        print(customPoint)   // Point(x: 5.0, y: 5.0)
        
        //Example 8: method calling
        3.repetitions {
            print("Hello")
        }
        
        //Example 9: Mutating instance method calling
        var someInt = 3
        someInt.square()
        
        //Example 10: Subscript Calling
        // Usage
        let myArray = CustomArray([1, 2, 3, 4, 5])

        // Accessing elements using the subscript
        if let element = myArray[2] {
            print("Element at index 2: \(element)") // Prints "Element at index 2: 3"
        } else {
            print("Index out of bounds")
        }
        
        //Example 11 : Nested type
        let outerInstance = OuterStructNested(outerProperty: 42)
        let innerInstance = OuterStructNested.InnerStructNested(innerProperty: "Hello")

        // Accessing original and extended functionality
        print(innerInstance.combinedProperties)
        // Prints "Hello - Hello"
        
        //Example Inherited class
        var objB = ClassB()
        print("objB.value", objB.value)
    }
    
}

//MARK: Extension Syntax
//extension SomeType {
//    // new functionality to add to SomeType goes here
//}

//MARK: Extension with Protocol Syntax
//extension SomeType: SomeProtocol, AnotherProtocol {
//    // implementation of protocol requirements goes here
//}

//MARK: 1 Source Code available in extension -- Struct extnesion
struct PersonExtension {
    var firstName: String
    var lastName: String
}

extension PersonExtension {
//    var middleName: String            // Error -- Extensions must not contain stored properties
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    func greet() {
        print("Hello, \(fullName)!")
    }
}

//MARK: 2 Source Code available in extension -- Class extension
class PersonExtensionClass {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension PersonExtensionClass {
//    var middleName: String            // Error -- Extensions must not contain stored properties
    var fullName: String {
        return "\(firstName) \(lastName)"
    }

    func greet() {
        print("Hello, \(fullName)!")
    }
}

//MARK: 5 -- Backward Compatibility
// Extension to add new functionality to Int
extension Int {
    var squared: Int {
        return self * self
    }
}

//MARK: 6 -- Computed Property
extension Double {
    var m: Double { return self }
    var mm: Double { return self / 1_000.0 }
}

//MARK: 7 Initializer
struct PointInitializer {
    var x: Double
    var y: Double
}

// Extension adding a new initializer to Point
extension PointInitializer {
    // Convenience initializer with default values
    init() {
        self.init(x: 0.0, y: 0.0)
    }

    // Custom initializer with a single value
    init(value: Double) {
        self.init(x: value, y: value)
    }
}

//MARK: 7.1 Initializer -- Error in this program
/*
struct SizeInitializer {
    var width = 0.0, height = 0.0
}
struct PointInitializerOne {
    var x = 0.0, y = 0.0
}
struct RectInitializer {
    var origin = PointInitializerOne()
    var size = SizeInitializer()
}

extension RectInitializer {
    init(center: PointInitializerOne, SizeInitializer: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        self.init(origin: PointInitializerOne(x: originX, y: originY),size: size)
        
//        self.init(origin: PointInitializerOne(x: originX, y: originY),size: size)
    }
} */

//MARK: 8 method
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

//MARK: 9 Mutating instance method
extension Int {
    mutating func square() {
        self = self * self
    }
}

//MARK: 10 Subscript
struct CustomArray<T> {
    private var elements: [T]

    init(_ elements: [T]) {
        self.elements = elements
    }
}

// Extension adding a subscript to CustomArray
extension CustomArray {
    subscript(index: Int) -> T? {
        guard index >= 0, index < elements.count else {
            return nil
        }
        return elements[index]
    }
}

//MARK: 11 Nested Type
struct OuterStructNested {
    var outerProperty: Int

    // Nested struct
    struct InnerStructNested {
        var innerProperty: String
    }
}

// Extension on the nested type InnerStruct
extension OuterStructNested.InnerStructNested {
    // New functionality for InnerStruct
    var combinedProperties: String {
        return "\(innerProperty) - \(innerProperty)"
    }
}

//MARK: Inherited class
//Any variable and method inside the extension is accessible to inherited classes.
class ClassA {
    var objA : Int = 0
}

class ClassB : ClassA {
    var objB : Int = 10
    
}

extension ClassA {
    var value : Int {
        return objA
    }
}
