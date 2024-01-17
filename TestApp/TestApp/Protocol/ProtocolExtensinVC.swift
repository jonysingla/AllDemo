//
//  ProtocolExtensinVC.swift
//  TestApp
//
//  Created by Jony on 17/01/24.
//

import UIKit

class ProtocolExtensinVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
//MARK: 1 Protocol Extension
protocol Addition {
    func addition (objA : Int, objB : Int) -> Int
}

extension ProtocolExtensinVC : Addition {
    func addition(objA: Int, objB: Int) -> Int {
        objA + objB
    }
    
    func substraction(objA: Int, objB: Int) -> Int {
        objA - objB
    }
}

//MARK: 2 Protocol Extension with Conditionally Conforming -- Where
protocol Loggable {
    func log() -> String
}

// Type with a conditional conformance to Loggable
struct MyStructConforming<T> {
    var value: T
}

// Conditional conformance to Loggable for MyStruct when T is Printable
extension MyStructConforming: Loggable where T: CustomStringConvertible {
    func log() -> String {
        return "Logged: \(value)"
    }
}

//MARK: 3 Declaring Protocol Adoption with an Extension
protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable { }

