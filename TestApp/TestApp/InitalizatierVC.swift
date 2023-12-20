//
//  InitalizatierVC.swift
//  TestApp
//
//  Created by Jony on 11/12/23.
//

import UIKit

class InitalizatierVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Designated Initalizer call
        let person = Person(name: "Jony")
        print("person name", person.name)
        
        // Conveniced Initalizer call
        let personConv = PersonConveniced(name: "hi")
        print("person name", personConv.name)
        
        // Required Initalizer
        let carValue = CarValue(color: "Black")
        print("Car Value", carValue.color)
        print("Car Value", carValue.carName)
        
        // Failable Initalizer
        let objFailable = FailableInitalizatier(id: "tesfdsfdsfdst")
        print("objFailable", objFailable?.id)
        
    }
}

//MARK: Failable Initalizer
class FailableInitalizatier {
    var id: String
    
    init?(id: String) {
        if id.count >= 8 {
            self.id = id
        } else {
            return nil
        }
    }
}


//MARK: Required Initalizer
class Vehicle {
    var color: String
    
    // Required initializer
    required init(color: String) {
        self.color = color
    }
}

class CarValue : Vehicle {
    var carName: String
    
    // Subclass must implement the required initializer
    required init(color: String) {
        self.carName = "Audi"
        super.init(color: color)
    }
}

//MARK: Conveniced Initalizer
class PersonConveniced {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        // Calls the designated initializer with default age
        self.init(name: name, age: 23)
    }
}

//MARK: Designated Initalizer
class Person {
    var name : String
    
    init(name: String) {
        self.name = name
    }
}
