//
//  OptinalViewController.swift
//  TestApp
//
//  Created by Jony on 01/12/23.
//

import UIKit

class OptionalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example  -- Declare Optional
        var name: String?

        // Example 1 -- Optional
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        print("possibleNumber",possibleNumber)
//        print("convertedNumber",convertedNumber)
        
        // Example 2 -- Set Nil
        var serverResponseCode: Int? = 404
        serverResponseCode = nil
        print("serverResponseCode",serverResponseCode)
        
        // Example 3 -- Without define value
        var serverResponseCodeOne: Int?
        print("serverResponseCodeOne",serverResponseCodeOne)
        
        // Example 4 -- Checking optional value it's contain or not using if or ==
        let possibleNumberCheck = "123"
        let convertedNumberCheck = Int(possibleNumberCheck)
        if convertedNumberCheck != nil {
            print("convertedNumber contains some integer value.")
        }
        
        // Example 5 -- Optional Binding
        let possibleNumberBinding : String? = "123"
        let convertedNumberBinding = possibleNumberBinding
        if let convertedNumberBinding = possibleNumberBinding {
            print("convertedNumberBinding contains some String value.")
        }
        
        // Example 6 -- Optional Binding
        let myNumber = Int(possibleNumber)
        if let myNumber {
            print("My number is \(myNumber)")
        }
        
        // Example 7 -- Providing Fallback -- nil-coalescing operator (??)
        let nameTest: String? = nil
        let greeting = "Hello, " + (nameTest ?? "friend") + "!"
        print(greeting)
        
        // Example 8 -- Force Unwrapping
        var objString : String! = ""
        var objValue = objString
        print(objString)
        
        // Example 9 -- Force Unwrapping
        let possibleNumberForce = "123"
        let convertedNumberForce = Int(possibleNumberForce)
        let number = convertedNumberForce!
        guard let number = convertedNumberForce else {
            fatalError("The number was invalid")
        }
        
        // Example 10 -- Implicitly Unwrapped Optionals
        let possibleStringImplicitly: String? = "An optional string."
        let forcedString: String = possibleStringImplicitly! // Requires explicit unwrapping
        
        // Example 11 -- Implicitly Unwrapped Optionals using if let
        let assumedString: String! = "An implicitly unwrapped optional string."
        if let definiteString = assumedString {
            print(definiteString)
        }
        
        // Example 11 -- Optional Chaining
        let studenName  = Student()
        studenName.degree = Course()
        
        if let courseName = studenName.degree?.courseTitle {
            print("Student is purusing", courseName)
        } else {
            print("Unable to receive course name")
        }
        
        // Example 12 -- Optional with Enum
        var userStatus: OptionalUserStatus = .some(.active)
        // Check for optional and access wrapped enum
        switch userStatus {
        case .some(let status):
            switch status {
            case .active:
                print("User is active")
            case .inactive(let reason):
                print("User is inactive due to: \(reason)")
            }
        case .none:
            print("User status is nil")
        }
        
    }
}
//MARK: Optional Chaining
class Student {
    var degree : Course?
}

class Course {
    var courseTitle = "B.tech"
}

//MARK: Optional with Enum
enum OptionalType<Value> {
    case none
    case some(Value)
}

enum OptionalUserStatus {
    case some(UserStatus)
    case none
}

enum UserStatus {
    case active
    case inactive(reason: String)
}

