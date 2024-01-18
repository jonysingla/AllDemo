//
//  ClassOnlyProtocolVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
//

import UIKit

class ClassOnlyProtocolVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

protocol SomeClassOnlyProtocol: AnyObject {
    func doSomething()
}

class MyClassOnlyProtocol: SomeClassOnlyProtocol {
    func doSomething() {
        print("Doing something in MyClass")
    }
}

// Uncommenting the following code would result in a compilation error
/*
struct MyStructOnlyProtocol: SomeClassOnlyProtocol {
    func doSomething() {
        print("Doing something in MyStruct")
    }
}*/


// Uncommenting the following code would result in a compilation error
/*
enum MyEnum: SomeClassOnlyProtocol {
    case case1, case2

    func doSomething() {
        print("Doing something in MyEnum")
    }
}*/

