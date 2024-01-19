//
//  ExtensionGenericVC.swift
//  TestApp
//
//  Created by Jony on 19/01/24.
//

import UIKit

class ExtensionGenericVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Example 5: Extending a Generic Type
        var stackOfStringsOne = Stack<String>()
        stackOfStringsOne.push("uno")
        stackOfStringsOne.push("dos")
        stackOfStringsOne.push("tres")
        stackOfStringsOne.push("cuatro")
        
        let fromTheTop = stackOfStringsOne.pop()
        if let topItem = stackOfStringsOne.topItem {
            print("The top item on the stack is \(topItem).")
        }
    }
}

//MARK: 5 Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
