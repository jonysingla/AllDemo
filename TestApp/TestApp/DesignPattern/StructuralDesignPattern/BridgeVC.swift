//
//  BridgeVC.swift
//  TestApp
//
//  Created by Jony on 31/01/24.
//

import UIKit

class BridgeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Example 1 Without Bridge
        let sedanWithoutBridge = SedanWithoutBridge()
        let redSedan = RedSedan()
        redSedan.drive()
        
        //Example 1.1 With Bridge
        let sedan = SedanWithBridge()
        let redSedanCar = RedCar(car: sedan)
        redSedanCar.drive()
        
        //Example 2
        let tvRemoteControl = RemoteControl(appliance: TV())
        tvRemoteControl.turnOn()
        
        let fancyVacuumCleanerRemoteControl = RemoteControl(appliance: VacuumCleaner())
        fancyVacuumCleanerRemoteControl.turnOn()
    }
}

//MARK: Example 1 ----
//MARK: Problem without Bridge
protocol CarWithoutBridge {
    func drive()
}

class SedanWithoutBridge: CarWithoutBridge {
    func drive() {
        print("drive a sedan")
    }
}

class SUVWithoutBridge: CarWithoutBridge {
    func drive() {
        print("drive a SUV")
    }
}

/* When adding color in car then we create a seperate class , this is not a solution
 if you can add multiple color for multple cars, Bridge Provide solution for this. */
class RedSedan: SedanWithoutBridge {
    override func drive() {
        print("drive a red sedan without bridge")
    }
}

//MARK: Solution with Bridge
protocol CarWithBridge {
    func drive()
}

protocol ColoredCar {
    var car: CarWithBridge { get set }
    //    func drive()
}

class SedanWithBridge: CarWithBridge {
    func drive() {
        print("drive a red sedan")
    }
}

class SUVWithBridge: CarWithBridge {
    func drive() {
        print("drive a SUV")
    }
}

class RedCar: ColoredCar {
    var car: CarWithBridge
    
    init(car: CarWithBridge) {
        self.car = car
    }
    
    func drive() {
        car.drive()
    }
}

//MARK: Example 2 ----
protocol Switch {
    var appliance: Appliance { get set }
    func turnOn()
}

protocol Appliance {
    func run()
}

class RemoteControl: Switch {
    var appliance: Appliance
    
    init(appliance: Appliance) {
        self.appliance = appliance
    }
    
    func turnOn() {
        self.appliance.run()
    }
}

class TV: Appliance {
    func run() {
        print("tv turned on");
    }
}

class VacuumCleaner: Appliance {
    func run() {
        print("vacuum cleaner turned on")
    }
}
