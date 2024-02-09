//
//  ObserverVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
//

import UIKit

class ObserverVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var observerInstance = Observer()
        var testChambers = TestChambers()
        testChambers.observer = observerInstance
        testChambers.testChamberNumber += 1
    }
}

protocol PropertyObserverPattern : AnyObject {
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

class TestChambers {
    weak var observer:PropertyObserverPattern?              // Here we are creating observer object

    private let testChamberNumberName = "testChamberNumber"

    var testChamberNumber: Int = 0 {
        willSet(newValue) {
            observer?.willChange(propertyName: testChamberNumberName, newPropertyValue: newValue)   // Calling observer pattern 
        }
        didSet {
            observer?.didChange(propertyName: testChamberNumberName, oldPropertyValue: oldValue)
        }
    }
}

class Observer : PropertyObserverPattern {
    func willChange(propertyName: String, newPropertyValue: Any?) {
        if newPropertyValue as? Int == 1 {
            print("Okay. Look.")
        }
    }

    func didChange(propertyName: String, oldPropertyValue: Any?) {
        if oldPropertyValue as? Int == 0 {
            print("Sorry about the mess.")
        }
    }
}
