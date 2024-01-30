//
//  AccessLevelVC.swift
//  TestApp
//
//  Created by Jony on 30/01/24.
//

import UIKit

class AccessLevelVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Example MARK: Getter and Setter
        // Outside the class, we can read the property but not modify it
        let instance = MyClassPublic()
        let currentValue = instance.value // This is allowed
        //        instance.value = 10 // This would result in a compiler error
        
    }
    //MARK: 2 Function Type
    //     func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    //        // function implementation goes here
    //        return
    //    }
}
//MARK: 1 Custom Type
public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}

//MARK: 3 Enum Type Access Level
private enum CompassPoint {
    case north
    case south
    case east
    case west
}

public enum MyEnum {
    case case1(String)  // Access level of associated value: public
    case case2(Int)     // Access level of associated value: internal
}

//MARK: 4 Getter and Setter
public class MyClassPublic {
    // Publicly accessible property with private setter
    public private(set) var value: Int = 0
    
    // Public method to modify the property
    public func setValue(newValue: Int) {
        // Inside the class, we can modify the property
        self.value = newValue
    }
}

//MARK: 5 Initializer Access level
public class MyClassAccessLevel {
    // Designated initializer with default access level (public)
    public init() {
        // Initialization code
    }
    
    // Convenience initializer with explicit access level (internal)
    internal convenience init(value: Int) {
        self.init()
        // Additional initialization code
    }
}

//MARK: 6 Protocol Access level
public protocol MyProtocolPublic {
    // Protocol definition
}

internal protocol MyProtocolInternal {
    // Protocol definition
}

fileprivate protocol MyProtocolFilePrivate {
    // Protocol definition
}

private protocol MyProtocolPrivate {
    // Protocol definition
}

protocol MyProtocolDefault {
    // Protocol definition
}

//MARK: 7 Extension Access level -- Change only type public to private , file private, internal,
public struct MyStructExtension {
    // Public type definition
}

public extension MyStructExtension {
    // Members added by the extension are also public
}
//MARK: Extension Access level -- 2 -- Error
internal struct MyInternalStruct {
    // Internal type definition
}

internal extension MyInternalStruct {
    // Error: Cannot add public members to internal type
    public func myMethod() {
        // Method implementation
    }
}

//MARK: 8 Generic Access level
public struct MyStructGeneric<T> {
    // Type parameter 'T' has public access level
    
    var property: T  // Property has public access level
    
    public func myFunction<T>(value: T) {
        // Function has public access level
    }
}

