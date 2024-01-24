//
//  ActorVC.swift
//  TestApp
//
//  Created by Jony on 08/01/24.
//

import UIKit

class ActorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        //Example 1 -- Without Actor
        let loggerOne = WithoutActor(label: "Outdoors", measurement: 25, max: 50)
        print(loggerOne.max)
        
        //Example 2 -- With Actor
        let logger = WithActor(label: "Outdoors", measurement: 25)
        //        print(logger.max)     // Error -- Actor-isolated property 'max' can not be referenced from the main actor
        //        print(await logger.max) // Error -- 'await' in a function that does not support concurrency
        Task {
            print(await logger.max)
        }
        
        //Example 3 -- With Actor
        // Usage
        let counterActor = CounterActor()
        
        Task {
            await counterActor.increment()
            print("Counter value: \(await counterActor.getValue())")
        }
        
        //Example 4 -- Without Actor
        var counterValue = 0
        func incrementCounter() {
            counterValue += 1
        }
        
        // Usage
        Task {
            incrementCounter()
            print("Counter value: \(counterValue)")
        }
        
        //Example 5 -- Isoloated
        var employeeIsolated = EmployeeIsolated(employeeID: 501, initialSalary: 12345.0)
        //        employeeIsolated.increaseSalary(amount: 20000) // Error -- Call to actor-isolated instance method 'increaseSalary(amount:)' in a synchronous main actor-isolated context
        print("employeeIsolated",employeeIsolated)
        
        //Example 5 -- Non-Isoloated
        var employeeNonIsolated = EmployeeNonIsolated(employeeID: 501, initialSalary: 12345.0)
        //        employeeNonIsolated.increaseSalary(amount: 40000)
        
        //Case 1 -- without await               // Error -- Call to actor-isolated instance method 'countryName()' in a synchronous main actor-isolated context
        //        var countryName = employeeNonIsolated.countryName()
        //        print("countryName", countryName)
        
        //Case 2 -- With await                  // Error -- 'await' in a function that does not support concurrency
        //        var countryNameAwait = await employeeNonIsolated.countryName()
        //        print("countryNameAwait", countryNameAwait)
        
        //Case 3 -- Working
        Task {
            var countryNameAwait = await employeeNonIsolated.countryName()
            print("countryNameAwait", countryNameAwait)
        }
    }
}

//MARK: Without Actor
class WithoutActor {
    let label: String
    var measurements: [Int]
    // Both case working
//    private(set) var max: Int
    var max: Int

    init(label: String, measurement: Int, max: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

//MARK: With Actor Example 1
actor WithActor {
    let label: String
    var measurements: [Int]
//    private(set) var max: Int
    var max: Int


    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

extension WithActor {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

extension WithActor {
    func convertFarenheitToCelsius() {
        measurements = measurements.map { measurement in
            (measurement - 32) * 5 / 9
        }
    }
}

//MARK: Not support inheritance Actor
//class child : WithActor {
//    
//}

//MARK: With Actor Example 2
actor CounterActor {
    private var value = 0

    func increment() {
        value += 1
    }

    func getValue() -> Int {
        return value
    }
}

//MARK: Isolated
actor EmployeeIsolated {
    let employeeID: Int
    var salary: Double
    
    init(employeeID: Int, initialSalary: Double) {
        self.employeeID = employeeID
        self.salary = initialSalary
    }
    
    func increaseSalary(amount: Double) {
        // Accessed from within the actor without await
        assert(amount >= 0)
        salary += amount
    }
}

//MARK: Non-Isoloated
actor EmployeeNonIsolated {
    let employeeID: Int
     var salary: Double = 50.0000
    
    init(employeeID: Int, initialSalary: Double) {
        self.employeeID = employeeID
        self.salary = initialSalary
    }
    
     nonisolated func increaseSalary(amount: Double) {
        // Accessed from within the actor without await
        assert(amount >= 0)
        
//        salary += 1
        // Error -- Actor-isolated property 'salary' can not be mutated from a non-isolated context (It means we can't change (mutate) actor property outside the actor)
    }
    
    nonisolated func countryName() -> [String] {
        return ["US","UK","AUS"]
    }
}


//MARK: nonisolated' can not be applied to stored properties
actor Foo {
    nonisolated let test = "Test String"
//    nonisolated var testOne = "Test String" // Error -- 'nonisolated' can not be applied to stored properties
}
