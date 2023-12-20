//
//  ClassStructViewController.swift
//  TestApp
//
//  Created by Jony on 18/12/23.
//

import UIKit

class ClassStructViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //MARK: Structure and Class instance
        var testStruct = TestStruct()
        let testClass = TestClass()
        
        //Example -- Accessing Property
        testClass.height = 20
        testStruct.width = 15
        
        //Example -- Memberwise Initalizers for Structure Types
        var testStru = TestStruct(width: 40, height: 50)
//        var testClas = TestClass(height: 80)  // class instances don’t receive a default memberwise initializer
        
        // Example how Structure work with copied or value type
        var value = testStru
        value.height = 200
        
        print("testStru.height", testStru.height)
        print("value.height", value.height)
        
        // Example how class work with reference
        let objClass = testClass
        objClass.height = 300
        print("testClass.height", testClass.height)
        print("objClass.height", objClass.height)
        
        // Example Identity Operator
        if objClass === testClass {
            print("Both class are same")
        } else {
            print("Both class are not same")
        }
    }
}


//MARK: Syntax Class
class TestClass {
    // class definition goes here
    var testStruct = TestStruct()
    var height = 0
    var width = 0
    
    // Inside function we can change value in class
    func test(objA : Int, objB : Int) {
        height = objA
        width = objB
    }
}

//MARK: Syntax Struct
struct TestStruct {
    // structure definition goes here
    // Object Definition
    var width = 0
    var height = 0
    
    // Inside functin we can't change value in struct so we need Mutating keyword to change value
    mutating func test(objA : Int, objB : Int) {
        height = objA
        width = objB
    }
}

