//
//  FacadeVC.swift
//  TestApp
//
//  Created by Jony on 31/01/24.
//

import UIKit

class FacadeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let factoryFacade = FactoryFacade()
        factoryFacade.produceCar()
    }
}

class Engine {
    func produceEngine() {
        print("prodce engine")
    }
}
class Body {
    func produceBody() {
        print("prodce body")
    }
}
class Accessories {
    func produceAccessories() {
        print("prodce accessories")
    }
}
//MARK: Facade design pattern -- Single class to extract data for multiple class
class FactoryFacade {
    
    let engine = Engine()
    let body = Body()
    let accessories = Accessories()
    
    func produceCar() {
        engine.produceEngine()
        body.produceBody()
        accessories.produceAccessories()
    }
}
