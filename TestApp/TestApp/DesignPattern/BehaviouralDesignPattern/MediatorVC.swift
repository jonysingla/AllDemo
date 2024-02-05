//
//  MediatorVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
//

import UIKit

class MediatorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let atc = AirTrafficControl()
        let boeing747_1 = Boeing747(mediator: atc)
        let boeing747_2 = Boeing747(mediator: atc)

        boeing747_1.send(message: "Hello, this is boeing747_1 requesting permission to land.", to: boeing747_2)
    }
}

protocol Airplane {
    var name: String { get }
    func receive(message: String, from: Airplane)
    func send(message: String, to: Airplane)
}

class AirTrafficControl {
    private var airplanes: [Airplane] = []
    
    func register(plane: Airplane) {
        airplanes.append(plane)
    }
    
    func send(message: String, from: Airplane, to: Airplane) {
        to.receive(message: message, from: from)
    }
}

//MARK: 1 Mediator
class Boeing747: Airplane {
    var name: String = "Boeing 747"
    private var mediator: AirTrafficControl

    init(mediator: AirTrafficControl) {
        self.mediator = mediator
        self.mediator.register(plane: self)
    }
    
    func receive(message: String, from: Airplane) {
        print("\(name) received message: '\(message)' from \(from.name)")
    }
    
    func send(message: String, to: Airplane) {
        mediator.send(message: message, from: self, to: to)
    }
}
