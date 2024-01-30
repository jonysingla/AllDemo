//
//  PrototypeVC.swift
//  TestApp
//
//  Created by Jony on 30/01/24.
//

import UIKit

class PrototypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let original = ConcretePrototype(property: 42)
        let copy1 = original.clone()
        let copy2 = original.clone()
        
        print(original.property)  // Output: 42
        print(copy1.property)    // Output: 42
        print(copy2.property) 
    }
}

protocol Prototype {
    func clone() -> Self
}

// Implement the prototype protocol in a class
class ConcretePrototype: Prototype {
    var property: Int
    
    init(property: Int) {
        self.property = property
    }
    
    // Implementation of NSCopying protocol.
    func copy(with zone: NSZone? = nil) -> Any {
        return ConcretePrototype(property: self.property)
    }
    
    func clone() -> Self {
        return copy() as! Self
    }
}
