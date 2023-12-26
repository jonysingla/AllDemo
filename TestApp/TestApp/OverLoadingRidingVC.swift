//
//  OverLoadingRidingVC.swift
//  TestApp
//
//  Created by Jony on 26/12/23.
//

import UIKit

class OverLoadingRidingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Calling Overloading
        var objSingleOverloading = callAPISync(endPoint: "Test")
        print("objSingleOverloading",objSingleOverloading)
        
        var objDoubleOverloading = callAPISync(endPoint: "Test One", value: 10.2)
        print("objDoubleOverloading",objDoubleOverloading)
        
        var objDoubleOverloadingInt = callAPISync(endPoint: "Test One", value: 10)
        print("objDoubleOverloadingInt",objDoubleOverloadingInt)
        
        // Calling Overriding
        var objInherit = InheritParent()
        print(objInherit.sharedMethod())
        
        // Calling Operator Overloading
        var objAddition = addition(10, 115)
        print("objAddition int value", objAddition)
        
        var addition = addition(10.0 , 14.0)
        print("objAddition double value", addition)
 
    }
    
    //MARK: 1 Overloading
    func callAPISync(endPoint: String) -> String {
        Thread.sleep(forTimeInterval: Double.random(in: 1...2))
        return "Response from \(endPoint)"
    }
    
    func callAPISync(endPoint: String, value: Double) -> (String, Double) {
        Thread.sleep(forTimeInterval: Double.random(in: 1...2))
        return (endPoint, value)
    }
    
    func callAPISync(endPoint: String, value: Int) -> String {
        Thread.sleep(forTimeInterval: Double.random(in: 1...2))
        return "Response from \(endPoint)"
    }
    
    //MARK: 3 Operator overloading
    func addition <T: Numeric> (_ a: T, _ b: T) -> T {
        return a + b
    }
}

//MARK: 2 Overriding
class SingletonOverriding : NSObject {
    static let sharedInstance = Singleton()
    var dataObjet = "Hello"
    func sharedMethod() {
        print("Singleton method called")
    }
    
    //
}

class InheritParent : SingletonOverriding {
    override func sharedMethod() {
        print("Overriding called")
    }
    
     func testMethod() {                    // Parent class can't override child class, only child class can override.
        print("Child method")
    }
}

//class childSecond : InheritParent {
//    override func testMethod() {
//        print("Child method")
//    }
//}
