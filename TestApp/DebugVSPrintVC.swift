//
//  DebugVSPrintVC.swift
//  TestApp
//
//  Created by Jony on 13/02/24.
//

import UIKit

class DebugVSPrintVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: print
        print("One two three four five")
        // Prints One two three four five

        print(1...5)
        // Prints 1...5

        print(1.0, 2.0, 3.0, 4.0, 5.0)
        // Prints 1.0 2.0 3.0 4.0 5.0
        
        //MARK: debug print
        debugPrint("One two three four five")
        // Prints "One two three four five"

        debugPrint(1...5)
        // Prints ClosedRange(1...5)

        debugPrint(1.0, 2.0, 3.0, 4.0, 5.0)
        // Prints "1.0 2.0 3.0 4.0 5.0"
    }
}
