//
//  AbstractFactoryVC.swift
//  TestApp
//
//  Created by Jony on 30/01/24.
//

import UIKit

class AbstractFactoryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let factoryA = FactoryA()
        let compactSedan = factoryA.produceSedan()
        let compactSUV = factoryA.produceSUV()
        compactSedan.drive()
        compactSUV.drive()
        
        let factoryB = FactoryB()
        let fullsizeSedan = factoryB.produceSedan()
        let fullsizeSUV = factoryB.produceSUV()
        fullsizeSedan.drive()
        fullsizeSUV.drive()
    }

}
//MARK: Protocol 1 Factory One Sedan------------
protocol SedanAbstract {
    func drive()
}
class CompactSedan: SedanAbstract {
    func drive() {
        print("drive a compact sedan")
    }
}
class MidSizeSedan: SedanAbstract {
    func drive() {
        print("drive a mid-size sedan")
    }
}
class FullSizeSedan: SedanAbstract {
    func drive() {
        print("drive a full-size sedan")
    }
}
//MARK: Protocol 2 Factory Two SUV------------
protocol SUVAbstract {
    func drive()
}
class CompactSUV: SUVAbstract {
    func drive() {
        print("drive a compact SUV")
    }
}
class MidSizeSUV: SUVAbstract {
    func drive() {
        print("drive a mid-size SUV")
    }
}
class FullSizeSUV: SUVAbstract {
    func drive() {
        print("drive a full-size SUV")
    }
}
//MARK: Protocol Main Abstract Factory -- Abstract means data hiding from outside class
protocol FactoryAbstract {
    func produceSedan() -> SedanAbstract
    func produceSUV() -> SUVAbstract
}

//MARK: Protocol Main Abstract Factory Class
class FactoryA: FactoryAbstract {
    func produceSedan() -> SedanAbstract {
        return CompactSedan()
    }
    func produceSUV() -> SUVAbstract {
        return CompactSUV()
    }
}
class FactoryB: Factory {
    func produceSedan() -> SedanAbstract {
        return FullSizeSedan()
    }
    func produceSUV() -> SUVAbstract {
        return FullSizeSUV()
    }
}
