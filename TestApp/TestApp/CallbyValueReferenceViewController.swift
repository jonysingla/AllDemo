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
        var objTestStructOne = TestStructOne()
        var objTwo = objTestStructOne
        objTwo.height = 40
        
        print("objTestStructOne",objTestStructOne.height)
        print("objTwo",objTwo.height)
        
        //////////////////////----------------------------------
        var objTestClasstOne = TestClassOne()
        var objThree = objTestClasstOne
        objThree.width = 50
        
        print("objTestStructOne",objTestClasstOne.width)
        print("objThree",objThree.width)
    }
}

struct TestStructOne {
    var height = 10
}
class TestClassOne {
    var width = 20
}
