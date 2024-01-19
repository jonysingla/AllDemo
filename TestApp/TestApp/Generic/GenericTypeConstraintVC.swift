//
//  GenericTypeConstraintVC.swift
//  TestApp
//
//  Created by Jony on 19/01/24.
//

import UIKit

class GenericTypeConstraintVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Example 6 Without Type Constraint in Action -- Or we can say Constraint with String
        let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
        if let foundIndex = findIndex(ofString: "llama", in: strings) {
            print("The index of llama is \(foundIndex)")
        }
        
        //Example 6.1 With Type Constraint Protocol -- No Constraint -- Conform to the Equatable protocol
        let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
        print("The result \(doubleIndex ?? 0)")
        let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
        print("The value is \(String(describing: stringIndex))")
        
       
        //Example 6.2 Conform to the Equatable protocol Type Constraint
        let result1 = isEqual(42, 42)      // Valid, Int conforms to Equatable
        let result2 = isEqual("A", "B")    // Valid, String conforms to Equatable
        // let result3 = isEqual(3.14, 3.14)  // Error, Double does not conform to Equatable
        print("result1",result1)
        print("result2",result2)

        //Example 6.3 Class Constraint
        let result3 = describeInstance(UIView())  // Valid, UIView is a class type
        // let invalidResult = describeInstance(42)  // Error, Int is not a class type
        print("result3",result3)

        //Example 6.4
        let result4 = combineStrings(42, "Hello")  // Valid, both Int and String conform to CustomStringConvertible
        print("result4",result4)
    }
    
    //MARK: 6 Without Type Constraint in Action -- Or we can say Constraint with String
    func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {                               // 0 - cat, 1 - dog, 2 - llama , 3 - parakeet, 4 - terrapin
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
    //MARK: 6.1 With Type Constraint Protocol -- No Constraint -- Conform to the Equatable protocol
    func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }

    //MARK: 6.2 Conform to the Equatable protocol Type Constraint
    // A generic function with a type constraint that requires the type to conform to the Equatable protocol
    func isEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {                    // Without Equatable showing error in ==
        return a == b
    }
    
    //MARK: 6.3 Class Constraint
    // A generic function with a type constraint that requires the type to be a class
    func describeInstance<T: AnyObject>(_ instance: T) -> String {
        return "Instance of class type: \(T.self)"
    }
    
    //MARK: 6.4 Multiple Protocol Constraint
    // A generic function with a type constraint that requires the type to be a class
    func combineStrings<T: CustomStringConvertible, U: CustomStringConvertible>(_ a: T, _ b: U) -> String {
        return a.description + b.description
    }

}
