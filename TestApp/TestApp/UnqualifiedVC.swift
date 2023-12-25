//
//  UnqualifiedVC.swift
//  TestApp
//
//  Created by Jony on 25/12/23.
//

import UIKit

class UnqualifiedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Example 1 -- Calling instance method
        let calculator = Calculator()
        
        // Using unqualified method name
        let sum = calculator.add(5, 3)
        print("Sum: \(sum)")
        
        // Example 2 -- Calling Type method
        
        // Using unqualified type method name
        let product = MathOperations.multiply(4, 3)
        print("Product: \(product)")
        
        
        // Example 3 -- Calling Property Access
        let origin = PointProperty(x: 0.0, y: 0.0)

        // Using unqualified property names
        let xCoordinate = origin.x
        let yCoordinate = origin.y
        print("Coordinates: (\(xCoordinate), \(yCoordinate))")
        
        // Example 3 -- Calling Function Parameter
        let personFunction = PersonFunction(name: "John Doe")

        // Using unqualified property name as a function parameter
        printPersonName(personFunction)
        
    }
}


//MARK: Instance Methods:
struct Calculator {
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}

//MARK: Type Methods:
struct MathOperations {
    static func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
}

//MARK: Property Access
struct PointProperty {
    var x: Double
    var y: Double
}

//MARK: Function Parameter
func printPersonName(_ person: PersonFunction) {
    print("Name: \(person.name)")
}

struct PersonFunction {
    var name: String
}
