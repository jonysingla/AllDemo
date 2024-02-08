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
