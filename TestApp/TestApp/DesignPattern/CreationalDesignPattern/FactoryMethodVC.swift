//
//  FactoryMethodVC.swift
//  TestApp
//
//  Created by Jony on 30/01/24.
//

import UIKit

class FactoryMethodVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //MARK: Without enum factory method
        let sedan = Sedan()
        sedan.drive()
        let suv = SUV()
        suv.drive()
        let van = Van()
        van.drive()
        
        //MARK: With help of enum
        let sedanEnum = Factory.produceCar(type: .sedan)
        sedanEnum.drive()
        let suvEnum = Factory.produceCar(type: .SUV)
        suvEnum.drive()
        let vanEnum = Factory.produceCar(type: .van)
        vanEnum.drive()
    }

}
enum CarType {
    case sedan, SUV, van
}

protocol CarFactory {
    func drive()
}

class Sedan: CarFactory {
    func drive() {
        print("drive a sedan")
    }
}
class SUV: CarFactory {
    func drive() {
        print("drive a SUV")
    }
}

class Van: CarFactory {
    func drive() {
        print("drive a van")
    }
}

class Factory {
    static func produceCar(type: CarType) -> CarFactory {
        switch type {
        case .sedan:
            return Sedan()
        case .SUV:
            return SUV()
        case .van:
            return Van()
        }
    }
}
