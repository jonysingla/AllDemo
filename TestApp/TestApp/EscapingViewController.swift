//
//  EscapingViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class EscapingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        callAPIEsc {
            print("Performing Escaping Asynchronous task")
        }
        callAPINonEsc {
            print("Performing Non Escaping synchronous task")
        }
    }
    
    func callAPIEsc(completion: @escaping() -> Void) {
        DispatchQueue.global().async {
            sleep(3)
            completion()
        }
    }
    
    func callAPINonEsc(completion: () -> Void) {
        print("Starting task")
        completion()
        print("Task completed")
    }
}
