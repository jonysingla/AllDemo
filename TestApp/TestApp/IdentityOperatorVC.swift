//
//  IndentityOperatorVC.swift
//  TestApp
//
//  Created by Jony on 04/12/23.
//

import UIKit

class IdentityOperatorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var personOne = IdentityOperator(objOne: "Hi", objTwo: "Hello")
        var personTwo = IdentityOperator(objOne: "Hi", objTwo: "Hello")
        
        var personThree = personOne
        
        if personThree === personOne {
            print("the two instances are equal!")
        } else {
            print("the two instances are not equal!")
        }
    }

}

class IdentityOperator {
    var objOne = String()
    var objTwo = String()
    
    init(objOne: String, objTwo: String) {
        self.objOne = objOne
        self.objTwo = objTwo
    }
    
}
