//
//  AdapterVC.swift
//  TestApp
//
//  Created by Jony on 31/01/24.
//

import UIKit

class AdapterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Calling Example 1
        let adaptee = Adaptee()
        let tar = Adapter(adaptee: adaptee)
        tar.request()
        
        //Calling Example 2
        let tarTwo = AdapterTwo()
        tarTwo.request()
    }
}

protocol Target {
    func request()
}

//MARK: Example 1 -- Class One as Adapter with Protocol -- this will work without protocol also
class Adapter: Target {
    
    //Creating object of class two Adaptee
    var adaptee: Adaptee
    
    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    func request() {
        //Function calling class two as Adaptee
        adaptee.specificRequest()
    }
}

//MARK: Class Two as Adaptee
class Adaptee {
    func specificRequest() {
        print("Specific request")
    }
}

//MARK: Example 2 --
class AdapteeTwo {
    func specificRequest() {
        print("Specific request Two")
    }
}
class AdapterTwo: AdapteeTwo, Target {
    func request() {
        specificRequest()
    }
}
