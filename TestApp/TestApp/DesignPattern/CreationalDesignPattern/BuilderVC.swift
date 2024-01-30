//
//  BuilderVC.swift
//  TestApp
//
//  Created by Jony on 30/01/24.
//

import UIKit

class BuilderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var sedanFactory = SedanFactory()
        var suvFactory = SuvFactory()
        
        var sedanDirector = Director(factory: sedanFactory)
        sedanDirector.produce()
        var suvDirector = Director(factory: suvFactory)
        suvDirector.produce()
        
    }
}


protocol FactoryBuilder {
    func produceWheel()
    func produceEngine()
    func produceChassis()
}

class SedanFactory : FactoryBuilder {
    func produceWheel() {
        print("produce wheel for sedan")
    }
    
    func produceEngine() {
        print("produce engine for sedan")
    }
    
    func produceChassis() {
        print("produce chassis for sedan")
    }
}

class SuvFactory : FactoryBuilder {
    func produceWheel() {
        print("produce wheel for SUV")
    }
    
    func produceEngine() {
        print("produce engine for SUV")
    }
    
    func produceChassis() {
        print("produce chassis for SUV")
    }
}

//Work as Builder 
class Director {
    var factory: FactoryBuilder
    
    init(factory: FactoryBuilder) {
        self.factory = factory
    }
    
    func produce() {
        factory.produceChassis()
        factory.produceEngine()
        factory.produceWheel()
    }
}
