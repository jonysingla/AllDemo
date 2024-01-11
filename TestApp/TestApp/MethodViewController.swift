//
//  MethodViewController.swift
//  TestApp
//
//  Created by Jony on 25/12/23.
//

import UIKit

class MethodViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Example 1 -- Calling instance method
        //        Counter.increment()                   // We can't directly call instance method , we can create object
        var counter = Counter()
        counter.increment()
        
        //Example 2 -- Calling instance method self
        var counterSelf = CounterSelf()
        counterSelf.increment()
        
        //Example 3 -- Calling instance method self with Parameter name
        var point = Point()
        print("point", point.changeValue(x: 1))
        
        //Example 4 -- Mutating below
        var pointMutating = PointMutating()
        print("pointMutating", pointMutating.changeValue())
        print("pointMutating", pointMutating.x)
        
        //Mutating method can't call with property
        var pointMutatingStruct = PointMutatingMethod(x: 3.0)
        pointMutatingStruct.changeValue(x: 5.0)
        
        //        let pointMutatingStructLet = PointMutatingMethod(x: 3.0) // -- Not working because we can't define property as a constant type
        //        pointMutatingStructLet.changeValue(x: 5.0)
        
        //Calling Mutating self
        var pointMutateSelf = PointMutatingSelf()
        pointMutateSelf.changeValue(x: 40.0)
        
        //Mutating enum with self -- function call itself
        var ovenLight = TriStateSwitch.low
        print("ovenLight.next()",ovenLight.next())
        print("ovenLight.next()",ovenLight.next())
        
        // ovenLight is now equal to .high
        //        ovenLight.next()
        // ovenLight is now equal to .off
        
        // Example 6 -- Calling type method
        SomeClass.someTypeMethod()
        
        // Example 7 -- Calling type method with static function
        SomeClassOne.someTypeMethod()
        
        // Example 8 -- Calling type method struct with static function
        var resutlt = AddMathOperation.addition(10, 15)
        print("resutlt -- ",resutlt)
        
        // Example 9 -- Calling a type method through a protocol
        let defaultReport = AnotherCustomReport.generateReport()
        print("Default Report: \(defaultReport)")
        // Output: Default Report: Default report
        
        //
        let defaultReportOne = CustomReport.generateReport()
        print("Default Report One: \(defaultReportOne)")
        
        var obj = SomeClassTest()
        SomeClassTest.someTypeMethod()
        SomeClassTest.someTypeMethodName()
    }
}

//MARK: Instance Method
class Counter {
    var count = 0
    func increment() {
        count += 1
        print("count", count)
    }
}

//MARK: Instance Method with Type Self
class CounterSelf {
    var count = 0
    func increment() {
        self.count += 2
        print("count self", count)
    }
}

//MARK: Instance Method with Type Self with Parameter name
struct Point {
    var x = 2.0
    func changeValue(x: Double) -> Bool {
//        print("Self.x", x)                      // without self -- 1.0
//        print("Self.x", self.x)                 // without self -- 2.0
//        print("X", x)                           // x value -- 1.0
        return self.x > x
    }
}

//MARK: Modifying Value Types from Within Instance Methods (Mutating)
struct PointMutating {
    var x = 2.0
    mutating func changeValue() {
        self.x += 1.0                       // without Mutating we can't change value of property in struct and enum
        print("x", x)
    }
}

//MARK: Modifying Value Types from Within Instance Methods (Mutating)
struct PointMutatingMethod {
    var x = 2.0
    mutating func changeValue(x: Double) {
        self.x += x
        print("x", x)
    }
}

//MARK: (Mutating) Self
struct PointMutatingSelf {
    var x = 2.0
    mutating func changeValue(x: Double) {
        self = PointMutatingSelf(x: x + x)
        print("x", x)
        print("x self", self.x)
    }
}

//MARK: (Mutating) ENUM with self
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

//MARK: Class Method
class SomeClass {
    class func someTypeMethod() {                       // Class function can be override
        // type method implementation goes here
    }
}

//MARK: Type (static) Method with in Class
class SomeClassOne {
    static func someTypeMethod() {                      // Static function can't be override
        print("Log Type Method with static function ")
    }
}

//MARK: Type Method in Struct with static
struct AddMathOperation {
    static func addition(_ a : Int, _ b : Int) -> Int {
        return a + b
    }
}

//MARK: Struct Inside Class
class SomeClassTwo {
    struct SomeClassTwoChild {
    }
}

//MARK: Class Inside Struct
struct SomeClassThree {
    class SomeClassThreeChild {
    }
}

//MARK: Type method with protocol and extension
protocol Reportable {
    static func generateReport() -> String
}

extension Reportable {
    static func generateReport() -> String {
        return "Default report"
    }
}

class AnotherCustomReport: Reportable {
    static func generateReport() -> String {
        return "Custom report from AnotherCustomReport"
    }
}

struct CustomReport: Reportable {
    // This type does not provide its own implementation for generateReport,
    // so it uses the default implementation provided by the protocol extension.
}


// Difference between class method and type method (Static)
class SomeClassTest {
    class func someTypeMethod() {
        // type method implementation goes here
    }
    
    static func someTypeMethodName() {
        // type method implementation goes here
    }
}
