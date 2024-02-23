//
//  OpenCloseVC.swift
//  TestApp
//
//  Created by Jony on 08/02/24.
//

import UIKit

class OpenCloseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK: Before Open Close Principle
class BShape {
    func calculateArea(length: Double, breadth: Double) -> Double {
        return length * breadth
    }
    // adding one more function
    func calculateArea(radius: Double) -> Double {
        return 3.14 * radius * radius
    }
}

//MARK: After Open Close Principle
protocol AShape {
    func calculateArea() -> Double
}

class Rectangle: AShape {
    var length: Double
    var width: Double
    
    init(length: Double, width: Double) {
        self.length = length
        self.width = width
    }
    func calculateArea() -> Double {
        return length * width
    }
}

class CircleOpen : AShape {
    var radius : Double
    
    init(radius: Double) {
        self.radius = radius
    }
    func calculateArea() -> Double {
        return 3.14 * radius * radius
    }
}

/*
// MARK:  Swift Open close principle
 The Open/Closed Principle in Swift states that a class should be open for extension but closed for modification. This means that the behavior of a class can be extended without modifying its source code.

One way to achieve this in Swift is by using protocols and protocol extensions. By defining protocols for different behaviors and providing default implementations in protocol extensions, classes can conform to these protocols and inherit the default behavior without needing to modify the original class.

Another approach is to use inheritance and subclassing. By creating a base class with common functionality and allowing subclasses to override specific methods or properties, new behavior can be added without changing the existing code.

Overall, following the Open/Closed Principle in Swift leads to more maintainable and flexible code, as it allows for easy extension and customization without risking unintended side effects or breaking existing functionality.
*/
