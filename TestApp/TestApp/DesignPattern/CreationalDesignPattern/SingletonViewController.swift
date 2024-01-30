//
//  SingletonViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class SingletonViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
//            
//            var objSingleton = Singleton()
//            objSingleton.obj = "Hi how"
//            print(objSingleton.obj)
//            objSingleton.singletonFunc()
            
            var objMyStructSingleton = MyStructSingleton()
            objMyStructSingleton.obj = "Good"
            print(objMyStructSingleton.obj)
            objMyStructSingleton.singletonFunc()
    }
}

class Singleton : NSObject {
    static let sharedInstance = Singleton()
    var obj = "Hello"
    
    func singletonFunc() {
        print("Hi")
    }
}

struct MyStructSingleton {
    static let sharedInstance = MyStructSingleton()
    var obj = "Hello"
    
    func singletonFunc() {
        print("very well")
    }
}
//MARK: Singleton Design Pattern -- We can also create as below also
class CarSingletonSimple {
    static let sharedInstance = CarSingletonSimple()
}

class CarSingleton {
    static let sharedInstance: CarSingleton = {
        let instance = CarSingleton()
        return instance
    }()
}
