//
//  CompositionProtocolVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
//

import UIKit

class CompositionProtocolVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct PersonCompositionProtocol: Named, Aged {
    var name: String
    var age: Int
}

