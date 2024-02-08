//
//  DataRaceConditionVC.swift
//  TestApp
//
//  Created by Jony on 08/02/24.
// https://www.avanderlee.com/swift/thread-sanitizer-data-races/#what-are-data-races

import UIKit

class DataRaceConditionVC: UIViewController {
    
    //MARK: 1. Data race condition without lazy
    private var name : String = ""
    
    //MARK: 2. Data race condition without lazy
    private lazy var lazyName : String = "Great"
    
    //MARK: Solve data race condition
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    
    override func viewDidLoad()  {
        super.viewDidLoad()

        DispatchQueue.global().async {
            self.lockQueue.async {
                //            self.name.append("Hello how are you")
                print("name -- ",self.lazyName)
            }
        }
        
        //Execuated on main thread
        lockQueue.async {
            //        print("name -- ",self.name)     // Error -- Swift access race in TestApp.ViewController.name.getter : Swift.String at 0x7b6000030000
                    print("name -- ",self.lazyName)
        }
    }
}
