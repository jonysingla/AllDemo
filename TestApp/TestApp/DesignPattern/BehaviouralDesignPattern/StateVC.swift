//
//  StateVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
//

import UIKit

class StateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Example usage
        let context = Context(state: StateA())
        context.request() // Output: State A handling
        context.request() // Output: State B handling
        context.request() // Output: State A handling
    }
}

protocol State {
    func handle(context: Context)
}

// Concrete state implementations
struct StateA: State {
    func handle(context: Context) {
        print("State A handling")
        // Change state if needed
        context.state = StateB()
    }
}

struct StateB: State {
    func handle(context: Context) {
        print("State B handling")
        // Change state if needed
        context.state = StateA()
    }
}

// Context class that holds the current state
class Context {
    var state: State

    init(state: State) {
        self.state = state
    }

    func request() {
        // Delegate handling to the current state
        state.handle(context: self)
    }
}
