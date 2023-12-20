//
//  ImplicitExplicitVC.swift
//  TestApp
//
//  Created by Jony on 14/12/23.
//

import UIKit

class ImplicitExplicitVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //MARK: Example 1 -- Implicit
        let valueInt = 42
        print("valueInt", valueInt)
                
        //MARK: Example 2 -- Explicit
        let valueString : String = "Hello"
        
        //MARK: Example 3 -- Implicit Unwrapping optional
        var optionalString: String? = "Hello, Swift!"

        if let unwrappedString = optionalString {
            print(unwrappedString) // Output: Hello, Swift!
        } else {
            print("The optional is nil.")
        }
        
        //MARK: Example 4 -- Implicit Member Expression
        struct Point {
            var x: Int
            var y: Int
        }
        let point = Point(x: 10, y: 20)

        // Implicit member expression to access struct properties
        let xValue = point.x
        let yValue = point.y
        print("x: \(xValue), y: \(yValue)") // Output: x: 10, y: 20
        
        
    }
    

}
