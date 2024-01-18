//
//  ProtocolCollectionVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
//

import UIKit

class ProtocolCollectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// Define a protocol
protocol Printable {
    func printDescription()
}

// Conform a class to the protocol
class Book: Printable {
    var title: String

    init(title: String) {
        self.title = title
    }

    func printDescription() {
        print("Book: \(title)")
    }
}

// Conform a struct to the protocol
struct CarProtocol: Printable {
    var brand: String

    func printDescription() {
        print("Car: \(brand)")
    }
}


