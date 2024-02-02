//
//  ChainOfResponsibilityVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
//

import UIKit

class ChainOfResponsibilityVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let handler1 = ConcreteHandler(threshold: 10)
        let handler2 = ConcreteHandler(threshold: 20)
        let handler3 = ConcreteHandler(threshold: 30)
        
        handler1.successor = handler2
        handler2.successor = handler3
        
        handler1.handleRequest(request: 5)
        handler1.handleRequest(request: 15)
        handler1.handleRequest(request: 25)
    }
}

protocol Handler {
    var successor: Handler? { get set }
    func handleRequest(request: Int)
}

class ConcreteHandler: Handler {
    var successor: Handler?
    let threshold: Int
    
    init(threshold: Int) {
        self.threshold = threshold
    }
    
    func handleRequest(request: Int) {
        if request <= threshold {
            print("Request \(request) handled by ConcreteHandler with threshold \(threshold)")
        } else if let successor = successor {
            successor.handleRequest(request: request)
        } else {
            print("No handler available for request \(request)")
        }
    }
}

