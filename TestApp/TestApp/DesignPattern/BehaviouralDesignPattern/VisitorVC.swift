//
//  VisitorVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
// https://github.com/eleev/swift-design-patterns/blob/main/Common%20Design%20Patterns/Behavioral/Visitor/Visitor.md

import UIKit

class VisitorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let shapes: [Element] = [CircleVisitor(radius: 5), RectangleVisitor(width: 4, height: 6)]
        let areaCalculator = AreaCalculator()

        for shape in shapes {
            shape.accept(visitor: areaCalculator)
        }
    }
}

//Element protocol that requires an accept() method
protocol Element {
    func accept(visitor: Visitor)
}

//create concrete element classes for each shape type:
class CircleVisitor: Element {
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func accept(visitor: Visitor) {
        visitor.visit(circle: self)
    }
}

class RectangleVisitor: Element {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func accept(visitor: Visitor) {
        visitor.visit(rectangle: self)
    }
}

//MARK: Define a Visitor protocol with visit methods for each concrete element:
protocol Visitor {
    func visit(circle: CircleVisitor)
    func visit(rectangle: RectangleVisitor)
}

class AreaCalculator: Visitor {
    func visit(circle: CircleVisitor) {
        let area = Double.pi * pow(circle.radius, 2)
        print("Circle area: \(area)")
    }
    
    func visit(rectangle: RectangleVisitor) {
        let area = rectangle.width * rectangle.height
        print("Rectangle area: \(area)")
    }
}
