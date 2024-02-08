//
//  LiskovSubstitutionVC.swift
//  TestApp
//
//  Created by Jony on 08/02/24.
//

import UIKit

class LiskovSubstitutionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK: Example 1 with Property
class RectangleCal {
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

class CircleCal : RectangleCal {
    override var length: Double {
        didSet {
            length = width
        }
    }
    
    override var width: Double {
        didSet {
            width = length
        }
    }
}

//MARK: Example 1 with function
class Bird {
    func fly() {
        print("Flying...")
    }
}

class Sparrow: Bird {
    override func fly() {
        print("Sparrow Flying...")
    }
}

class Cow: Bird {
    override func fly() {
        print("Cow not Flying...")
    }
}
