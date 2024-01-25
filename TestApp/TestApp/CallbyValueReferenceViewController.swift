//
//  CallbyValueReferenceViewController.swift
//  TestApp
//
//  Created by Jony on 18/12/23.
//

import UIKit

class CallbyValueReferenceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Example 1: Calling Call by Value
        var objTestStructOne = TestStructOne()
        var objTwo = objTestStructOne
        objTwo.height = 40
        
        print("objTestStructOne",objTestStructOne.height)
        print("objTwo",objTwo.height)
        
        //Example 2: Calling Call by Reference
        var objTestClasstOne = TestClassOne()
        var objThree = objTestClasstOne
        objThree.width = 50
        
        print("objTestStructOne",objTestClasstOne.width)
        print("objThree",objThree.width)
    }
}
//MARK: Call by Value
struct TestStructOne {
    var height = 10
}
//MARK: Call by Reference
class TestClassOne {
    var width = 20
}
