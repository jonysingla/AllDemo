//
//  ProtocolViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class ProtocolViewController: UIViewController , SomeProtocol, PropertyProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let objViewController = ProtocolViewController()
        objViewController.SubTractionInteger()
                
    }
}

//MARK: Protocol Syntax or Method Protocol
@objc protocol SomeProtocol {
    @objc optional func additionInteger()
    
}
//MARK: Protocol Extension
extension SomeProtocol {
    func SubTractionInteger() {
        print("Default implementation of doSomething")
    }
}
//MARK: Property Protocol
@objc protocol PropertyProtocol {
    @objc optional var objA : String {get set}
    @objc optional var objB : String {get set }
}

//MARK: Method Protocol
protocol Togglable {
    mutating func toggle()
}

//MARK: Initializer Requirement
protocol initaliZeProtocol{
    init(someParameter: Int)
}
