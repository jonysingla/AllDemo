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

        // Do any additional setup after loading the view.
        var objRace = Race()
        print("Val: \(String(describing: objRace.lap))")
        objRace.lap = nil
        print("Val: \(String(describing: objRace.lap))")

    }
    
}

class Race {
    var lap : Int? = nil
    init() {
        lap = 5
        print("Race Completed")
    }
    deinit {
        print("Memory Deallocated")
    }
}
