//
//  DeinitalizeViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class DeinitalizeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var result: Race? = Race()
        // Do any additional setup after loading the view.
    }
    
}

class Race {
    var lap : Int = 0
    init() {
        lap = 5
        print("Race Completed")
    }
    
    deinit {
        print("Memory Deallocated")
      }
}
