//
//  SemaphorVC.swift
//  TestApp
//
//  Created by Jony on 22/02/24.
//

import UIKit

class Semaphor {
    private var count: Int
    private let queue: DispatchQueue
    private let semaphore: DispatchSemaphore
    
    init(initialValue: Int) {
        self.count = initialValue
        self.queue = DispatchQueue(label: "semaphoreQueue")
        self.semaphore = DispatchSemaphore(value: initialValue)
    }
    
    func wait() {
        semaphore.wait()
        queue.sync {
            self.count -= 1
        }
    }
    
    func signal() {
        queue.sync {
            self.count += 1
        }
        semaphore.signal()
    }
}
