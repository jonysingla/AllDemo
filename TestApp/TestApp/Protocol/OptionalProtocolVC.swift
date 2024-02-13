//
//  OptionalProtocolVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
//

import UIKit

class OptionalProtocolVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
//MARK: With Optional
@objc protocol MyOptionalProtocol {
    @objc optional func optionalMethod()
    @objc optional var optionalProperty: String { get }
}

class MyClassOptionalProtocol: MyOptionalProtocol {
    // Implementing optionalMethod is optional for conforming types
    func optionalMethod() {
        print("Implemented optionalMethod in MyClass")
    }

    // Implementing optionalProperty is also optional
    var optionalProperty: String {
        return "Implemented optionalProperty in MyClass"
    }
}

//MARK: Can we use optional protocol in struct? No, we can't achieve this by using extension also.
/*
 @objc protocol TestProtocol {
     @objc optional func addtionTwoNumer ()
 }

 struct TestOneTwo  {
 }

 extension TestOneTwo : TestProtocol {
     func addtionTwoNumer() {
     }
 }
*/
