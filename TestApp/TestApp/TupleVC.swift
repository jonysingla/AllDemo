//
//  TupleVC.swift
//  TestApp
//
//  Created by Jony on 01/12/23.
//

import UIKit

class TupleVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Example 1 ---- access the individual element values in a tuple using index
        let http404Error = (404, "Not found")
        print("httperror status code",http404Error.0)
        print("httperror status Message",http404Error.1)
        
        // Example 2 ---- Permutation of types
        let (statusCode, statusMessage) = http404Error
        print("The status code is \(statusCode)")
        print("The status message is \(statusMessage)")
        
        // Example 3 ---- ignore parts of the tuple with an underscore (_)
        let (justTheStatusCode, _) = http404Error
        print("The status code is \(justTheStatusCode)")
        
        // Example 4 ---- name the individual elements in a tuple when the tuple is defined:
        // use the element names to access the values of those elements
        let http200Status = (statusCode: 200, description: "OK")
        print("The status code is \(http200Status.statusCode)")
        print("The status message is \(http200Status.description)")
        
        // Empty tuple
        let emptyTuple = ()
        print("emptyTuple",emptyTuple)
        
        // Compare two tuple
        let tupleOne = (1, "Hello", true)
        let tupleTwo = (1, "Hello", true)
        
        if tupleOne == tupleTwo {
            print("Tuples are equal")
        } else {
            print("Tuples are not equal")
        }
        
        // Nested Tuple
        var alphaNum = ("x", 1, 2, ("y", 3, "z"))
        print("first value print", alphaNum.0)
        print("first value print", alphaNum.1)
        print("first value print", alphaNum.2)
        print("first value print", alphaNum.3)
        print("first value print", alphaNum.3.0)
        print("first value print", alphaNum.3.1)
        print("first value print", alphaNum.3.2)
        
        let nestedTuple: (Int, (String, Bool), Double) = (42, ("apple", true), 3.14)
        print("Nested tuple", nestedTuple.0)
        print("Nested tuple", nestedTuple.1.0)
        print("Nested tuple", nestedTuple.1.1)
        print("Nested tuple", nestedTuple.2)
        
    }
}
