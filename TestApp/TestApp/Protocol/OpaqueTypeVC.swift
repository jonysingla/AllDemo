//
//  OpaqueTypeVC.swift
//  TestApp
//
//  Created by Jony on 17/01/24.
//

import UIKit

class OpaqueTypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        func getAnimal() -> some Animal {
            return Dog()
        }
    }
}

protocol Animal {
    func makeSound() -> String
}

struct Dog: Animal {
    func makeSound() -> String {
        return "Woof"
    }
}

struct Cat: Animal {
    func makeSound() -> String {
        return "Meow"
    }
}


