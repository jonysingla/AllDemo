//
//  ProxyVC.swift
//  TestApp
//
//  Created by Jony on 31/01/24.
//

import UIKit

class ProxyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Without Proxy
        let objSedan = SedanProxy()
        objSedan.drive()
        
        //With Proxy
        let sedan = SedanProxy()
        let autonomousCar = AutonomousCarProxy(car: sedan)
        autonomousCar.drive()
    }

}

protocol CarProxy {
    func drive()
}

class SedanProxy: CarProxy {
    func drive() {
        print("drive a sedan")
    }
}
//MARK: Proxy
class AutonomousCarProxy: CarProxy {
    var car: CarProxy
    
    init(car: CarProxy) {
        self.car = car
    }
    
    func drive() {
        car.drive()
        print("by self-driving system")
    }
}
