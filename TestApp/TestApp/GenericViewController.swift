//
//  GenericViewController.swift
//  TestApp
//
//  Created by Jony on 11/12/23.
//

import UIKit

class GenericViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("Addition Integer", add(10, 15))
        print("Addition Float", add(10.3, 15.5))
        
        
    }
    //MARK: Generic
    func add<T: Numeric>(_ a: T, _ b: T) -> T {
        return a + b
    }

}
