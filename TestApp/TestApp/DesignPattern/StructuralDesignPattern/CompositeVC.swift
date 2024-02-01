//
//  CompositeVC.swift
//  TestApp
//
//  Created by Jony on 31/01/24.
//

import UIKit

class CompositeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var whiteboard = Whiteboard(CircleComposite(), SquareComposite())
        whiteboard.draw(fillColor: "Red")
    }
}

protocol ShapeComposite {
    func draw(fillColor: String)
}

class SquareComposite: ShapeComposite {
    func draw(fillColor: String) {
        print("Drawing a Square with color \(fillColor)")
    }
}

class CircleComposite: ShapeComposite {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}
//MARK: Here we are using Composite Design Pattern
class Whiteboard: ShapeComposite {
    private lazy var shapes = [ShapeComposite]()

    init(_ shapes: ShapeComposite...) {
        self.shapes = shapes
    }

    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}
