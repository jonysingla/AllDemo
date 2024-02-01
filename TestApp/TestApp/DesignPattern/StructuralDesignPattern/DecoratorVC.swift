//
//  DecoratorVC.swift
//  TestApp
//
//  Created by Jony on 31/01/24.
//

import UIKit

class DecoratorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let sedan = SedanDecorator()
        let autonomousSedan = AutonomousCar(car: sedan)
        autonomousSedan.drive()
    }
}

//MARK: Without Decorator Design Pattern
enum CarTypeDecorator: String {
    case Sedan = "sedan"
    case SUV = "SUV"
}

protocol CarDecorator {
    var type: CarTypeDecorator{ get }
    func drive()
}

class SedanDecorator: CarDecorator {
    var type: CarTypeDecorator = .Sedan
    func drive() {
        print("drive a " + type.rawValue)
    }
}
/*
 Now it's working fine. If we want to add some more Autonomous classes then we can
 use same inheritance again, and this will create code complex high, so we can use Decorator Design Pattern
 and pass value at run time.
 */
class AutonomousSedan: SedanDecorator {
    override func drive() {
        print("automatically drive a " + type.rawValue)
    }
}

//MARK: With Decorator Design Pattern
class Decorator: CarDecorator {
    
    var car: CarDecorator
    var type: CarTypeDecorator {
        return car.type
    }
    
    init(car: CarDecorator) {
        self.car = car
    }
    
    func drive() {
        car.drive()
    }
}

class AutonomousCar: Decorator {
    override func drive() {
        print("automatically drive a " + type.rawValue)
    }
}
