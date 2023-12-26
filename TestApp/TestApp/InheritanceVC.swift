//
//  InheritanceVC.swift
//  TestApp
//
//  Created by Jony on 26/12/23.
//

import UIKit

class InheritanceVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Example 1 -- Calling Base class
        let someVehicle = VehicleBase()
        print("currentSpeed", someVehicle.currentSpeed)
        print("description", someVehicle.description)
        
        //Example 2 -- Calling Subclass
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        
        bicycle.currentSpeed = 20.0
        print("Bicycle: \(bicycle.description)")
        
        //Example 3 -- Calling Multilevel class
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        print("Tandem: \(tandem.description)")
        
        //Example 4 -- Accessing Superclass Methods, Properties, and Subscripts
        // Below example
        
        //Example 5 -- Preventing Override -- Final
        // Example self
        
    }
}

//MARK: Base Class or SuperClass
class VehicleBase {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        print("Make some noise")
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

//MARK: Subclass
class Bicycle: VehicleBase {
    var hasBasket = false
    
//    override var currentSpeed: Double = 50.0                // Cannot override with a stored property 'currentSpeed' we can use setter and getter for this

    override func makeNoise() {                              // Overriding method
        print("Make some noise hehehhehehe")
    }
}


//MARK: Multilevel
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

class ParentClass {
    func someMethod() {
        print("ParentClass - someMethod")
    }
}

//MARK: Using super keyword with property / method
//class Bicycle: VehicleBase {
//    var hasBasket = false
//
//    override var currentSpeed: Double {
//            get {
//                // Access the superclass version of Property
//                let parentValue = super.currentSpeed
//                return parentValue
//            }
//            set {
//                // Access the superclass version of Property in the setter
//                super.currentSpeed = newValue
//            }
//        }
//
//    override func makeNoise() {
//        // Accessing Superclass methods
//        super.makeNoise()
//        print("Make some noise hehehhehehe")
//    }
//}

////MARK: Using super keyword subscript
//class ParentClassOne {
//    subscript(someIndex: Int) -> String {
//        return "ParentClass - Default Value"
//    }
//}
//
//class ChildClassOne: ParentClassOne {
//    // Override the subscript for someIndex
//    override subscript(someIndex: Int) -> String {
//        get {
//            // Access the superclass version of the subscript
//            let parentValue = super[someIndex]
//            return "\(parentValue) overridden by ChildClass"
//        }
//        set {
//            // Access the superclass version of the subscript in the setter
//            super[someIndex] = newValue
//        }
//    }
//}

