//
//  ProtocolInheritanceVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
//

import UIKit

class ProtocolInheritanceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
//MARK: 1 Multilevel Protocol Inheritance
// Base protocol
protocol PrintableInheritance {
    func printDescription()
}

// Inherited protocol
protocol LoggableInheritance: PrintableInheritance {
    func logMessage()
}

// Conforming to Loggable
class LoggerInheritance: LoggableInheritance {
    func printDescription() {
        print("Logger's description")
    }

    func logMessage() {
        print("Logging a message")
    }
}

//MARK: 2 Multiple Protocol Inheritance
protocol Playable {
    func play()
}

protocol Recordable {
    func record()
}

// Protocol inheritance with multiple protocols
protocol Musician: Playable, Recordable {
    var instrument: String { get }
}

struct Guitarist: Musician {
    var instrument: String

    func play() {
        print("Playing the \(instrument)")
    }

    func record() {
        print("Recording with the \(instrument)")
    }
}

