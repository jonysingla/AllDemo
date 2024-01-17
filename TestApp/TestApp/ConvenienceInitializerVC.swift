//
//  ConvenienceInitializerVC.swift
//  TestApp
//
//  Created by Jony on 17/01/24.
//

import UIKit

class ConvenienceInitializerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Usage
        let person1 = PersonConvenicedInitalizatier(name: "John", age: 30)
        let person2 = PersonConvenicedInitalizatier(name: "Alice") // Uses the convenience initializer

        print(person1.name, person1.age) // Prints "John 30"
        print(person2.name, person2.age) // Prints "Alice 25"
    }
    
}

class PersonConvenicedInitalizatier {
    var name: String
    var age: Int

    // Designated initializer
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    // Convenience initializer
    convenience init(name: String) {
        // Calls the designated initializer with a default age
        self.init(name: name, age: 25)
    }
}
