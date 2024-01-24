//
//  TaskGroupVC.swift
//  TestApp
//
//  Created by Jony on 05/01/24.
//

import UIKit

class TaskGroupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Example 1 -- Task & Task Group Call the function that fetches data in parallel
        Task {
            print("Task start   : \(Date())")
            let operations = [
                DivideOperation(name: "operation-0", a: 5, b: 1, sleepDuration: 5),
                DivideOperation(name: "operation-1", a: 14, b: 7, sleepDuration: 1),
            ]
            let allResults = await withTaskGroup(of: (String, Double).self, returning: [String: Double].self) { taskGroup in
                for operation in operations {
                    taskGroup.addTask {
                        let value = await operation.execute()
                        print("operation name & Value", operation.name, value)
                        return (operation.name, value)
                    }
                }
                // Collect results of all child task in a dictionary
                var childTaskResults = [String: Double]()
                for await result in taskGroup {
                    // Set operation name as key and operation result as value
                    childTaskResults[result.0] = result.1
                }
                // All child tasks finish running, thus task group result
                return childTaskResults
            }
            print("Task end     : \(Date())")
            print("allResults   : \(allResults)")
        }
        
        //MARK: Example 2 -- Task Cancelled -- addTaskUnlessCancelled
        Task {
            print("Task start   : \(Date())")
            let operations = [
                DivideOperation(name: "operation-0", a: 5, b: 1, sleepDuration: 5),
                DivideOperation(name: "operation-1", a: 14, b: 7, sleepDuration: 1),
            ]
            let allResults = await withTaskGroup(of: (String, Double).self, returning: [String: Double].self) { taskGroup in
                for operation in operations {
                    taskGroup.addTaskUnlessCancelled {
//                        guard isCancelled == false else { return nil } // Error -- isCancelled
//                        return (operation.name, value)
                        
                        let value = await operation.execute()
                        print("operation name & Value", operation.name, value)
                        return (operation.name, value)
                        
                    }
                }
                // Collect results of all child task in a dictionary
                var childTaskResults = [String: Double]()
                for await result in taskGroup {
//                    // Set operation name as key and operation result as value
                    childTaskResults[result.0] = result.1
                }
//                // All child tasks finish running, thus task group result
                return childTaskResults
            }
            print("Task end     : \(Date())")
            print("allResults   : \(allResults)")
        }
        
        //MARK: Example 3 -- Task check Cancellation & Task is Cancel
        // Create a task
        let task = Task {
            // Perform the task
            await performTask()
        }

        // Simulate cancellation after 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            task.cancel()
        }

        // Keep the program running for a while to allow asynchronous tasks to complete
        RunLoop.main.run(until: Date(timeIntervalSinceNow: 10))
        
        //MARK: Example 4 -- Unstructure Concurrency
        // Simple Example -- let newPhoto = // ... some photo data ...
//        let handle = Task {
//            return await add(newPhoto, toGalleryNamed: "Spring Adventures")
//        }
//        let result = await handle.value
        
        // More detail example --
        func performTaskUnstructure(completion: @escaping () -> Void) {
            // Simulate an asynchronous operation
            DispatchQueue.global().async {
                // Do some work asynchronously
                print("Performing the task")

                // Call the completion handler when the task is done
                completion()
            }
        }

        // Perform multiple tasks concurrently in an unstructured way
        performTaskUnstructure {
            print("Task 1 completed")
        }

        performTaskUnstructure {
            print("Task 2 completed")
        }

        // Simulate waiting for tasks to complete (not structured)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("All tasks completed (unstructured)")
        }
        
        //MARK: Example 5 -- Structure Concurrency
        func performTaskStructure() async {
            // Simulate an asynchronous operation
            await Task {
                // Do some work asynchronously
                print("Performing the task")
            }
        }

        // Perform multiple tasks concurrently in a structured way
        Task {
            await performTaskStructure()
            print("Task 1 completed")
        }

        Task {
            await performTaskStructure()
            print("Task 2 completed")
        }

        // Structured concurrency ensures that all tasks are awaited before continuing
//        await Task.whenAllComplete()          // Error --
        print("All tasks completed (structured)")
        
    }
    
    func performTask() async {
        for i in 1...5 {
            // Simulate some work
            print("Working on iteration \(i)")

            // Check for cancellation before continuing with the next iteration
            if Task.isCancelled {                                   // Working
//            if Task.checkCancellation() {                         // Not working error -- Cannot convert value of type '()' to expected condition type 'Bool'
                print("Task has been canceled. Cleaning up...")
                // Perform cleanup operations before exiting the task
                return
            }

            // Simulate asynchronous operation
            await Task.sleep(1_000_000_000) // Sleep for 1 second
        }

        print("Task completed successfully")
    }
}

//MARK: 1 Task group
struct DivideOperation {
    
    let name: String
    let a: Double
    let b: Double
    let sleepDuration: UInt64
    
    func execute() async -> Double {
        
        // Sleep for x seconds
        //        await Task.sleep(sleepDuration * 1_000_000_000)
        do {
            try await Task.sleep(for: .seconds(sleepDuration)) // Sleep for 2 seconds --
        } catch {
            print("Error")
        }
        
        let value = a / b
        return value
    }
}
