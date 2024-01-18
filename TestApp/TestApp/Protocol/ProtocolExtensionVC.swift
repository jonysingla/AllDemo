//
//  ProtocolExtensionVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
//

import UIKit

class ProtocolExtensionVC: UIViewController,AdditionTwoNumber {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //MARK: 2 Default implementation
        // If we comment extension code then give Error -- Type 'ProtocolExtensionVC' does not conform to protocol 'AdditionTwoNumber'
        // No need to implement AdditionTwoNumber; it gets the default implementation

    }
}
//MARK: 1 Protocol Extension
extension AdditionTwoNumber {
    func addition () {
        print("Will be print two number here")
    }
}


protocol AdditionTwoNumber {
    func addition ()
}

//MARK: 3 Adding Constraints to Protocol Extensions
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for element in self {
            if element != self.first {
                return false
            }
        }
        return true
    }
}
