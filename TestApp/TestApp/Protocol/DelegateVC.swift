//
//  DelegateVC.swift
//  TestApp
//
//  Created by Jony on 17/01/24.
//

import UIKit

class DelegateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let delegator = Delegator()
//        let delegateObject = MyDelegateClass()
//
//        // Set the delegate
//        delegator.delegate = delegateObject
//
//        // Perform the task, and the delegate will be notified
//        delegator.performTask()
    }

}

protocol MyDelegate: AnyObject {
    func didPerformTask(result: String)
}

// Class that will delegate a task to another object
class Delegator {
    weak var delegate: MyDelegate?

    func performTask() {
        // Do some work
        let result = "Task completed successfully"

        // Notify the delegate that the task is done
        delegate?.didPerformTask(result: result)
    }
}

// Class that acts as the delegate and implements the protocol
class MyDelegateClass: MyDelegate {
    func didPerformTask(result: String) {
        print("Delegate received result: \(result)")
    }
}
