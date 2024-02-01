//
//  FlyweightVC.swift
//  TestApp
//
//  Created by Jony on 31/01/24.
//

import UIKit

class FlyweightVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let factory = FactoryFlyweight()
        let redSedan = factory.getCar(color: .red)
        redSedan.drive()
        
        let greenSedan = factory.getCar(color: .green)
        greenSedan.drive()
    }
}

protocol CarFlyWeight {
    var color: UIColor { get }
    func drive()
}

class SedanFlyWeight: CarFlyWeight {
    var color: UIColor
    
    init(color: UIColor) {
        self.color = color
    }
    func drive() {
        print("drive a sedan \(color)")
    }
}
//MARK: Flywieght Design Pattern
/*
 To checking if data is storage or not, if not then we can store data and use in future.
 */

class FactoryFlyweight {
    var cars: [UIColor: CarFlyWeight] = [UIColor: CarFlyWeight]()
    
    func getCar(color: UIColor) -> CarFlyWeight {
        if let car = cars[color] {
            return car
        } else {
            let car = SedanFlyWeight(color: color)
            cars[color] = car
            return car
        }
    }
}
