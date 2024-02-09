//
//  StrategyVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
//

import UIKit

class StrategyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Example usage
        let context = ContextStrategy(strategy: ConcreteStrategyA())
        context.executeStrategy() // Output: Executing strategy A

        context.setStrategy(strategy: ConcreteStrategyB())
        context.executeStrategy() // Output: Executing strategy B
    }
}

protocol Strategy {
    func execute()
}

// Concrete strategy implementations
struct ConcreteStrategyA: Strategy {
    func execute() {
        print("Executing strategy A")
    }
}

struct ConcreteStrategyB: Strategy {
    func execute() {
        print("Executing strategy B")
    }
}

//MARK: Strategies Design pattern
// ContextStrategy class that holds the current strategy
class ContextStrategy {
    private var strategy: Strategy

    init(strategy: Strategy) {
        self.strategy = strategy
    }

    func setStrategy(strategy: Strategy) {
        self.strategy = strategy
    }

    func executeStrategy() {
        strategy.execute()
    }
}
