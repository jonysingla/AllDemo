//
//  ConcurrentVC.swift
//  TestApp
//
//  Created by Jony on 04/01/24.
//

import UIKit

class ConcurrentVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Example 1 -- Calling Defining and Calling Asynchronous Functions
//    Continuation:
        
//        async {                                           //  'async(priority:operation:)' is deprecated: `async` was replaced by `Task.init` and will be removed shortly.
//            let result = await fetchDataFromServer()
//            print("Received data: \(result)")
//        }
        Task {
            let result = await fetchDataFromServer()
            print("Received data: \(result)")
        }
        
        // Example 2 --  With Yield or Without Yield
        Task {
            await withoutYield()
//            let result = await withoutYield()
//            print("Received data: \(result)")
        }
        
        Task {
            await withYield()
//            let result = await withYield()
//            print("Received data: \(result)")
        }
        
        // Example 3 -- Asynch with Throws
        Task {
            let photos = try await listPhotos(inGallery: "A Rainy Weekend")
        }

        // Example 4 -- Async Sequence Calling
        Task {
            await consumeAsyncSequence()
        }
        
        func consumeAsyncSequence() async {
            do {
                for try await value in MyAsyncSequence() {
                    print(value)
                } } catch {
                    print("Error Handle")
                }
        }
    }
    

    
    
    //MARK: 1  Defining and Calling Asynchronous Functions
    func fetchDataFromServer() async -> String {
        let result = await performAsyncOperation()
        return result
    }

//    Awaiting an Asynchronous Operation:
    func performAsyncOperation() async -> String {
        // Simulate an asynchronous operation
//        await Task.sleep(2 * 1_000_000_000)  // Sleep for 2 seconds -- Warning (sleep' is deprecated: replaced by 'Task.sleep(nanoseconds:)) for error handling so used try block because of return type
        
        do {
            try await Task.sleep(for: .seconds(2)) // Sleep for 2 seconds --
        } catch {
            print("Error")
        }
        return "Async operation completed"
    }
    
    
    
    //MARK: 2 Without Task.Yield
    func withoutYield() async {
        print("Task A: Start withoutYield")
        await performAsyncOperationYield()
        print("Task A: End withoutYield")
    }

    func performAsyncOperationYield() async {
//        await Task.sleep(2 * 1_000_000_000) // Sleep for 2 seconds
        do {
            try await Task.sleep(for: .seconds(2)) // Sleep for 2 seconds --
        } catch {
            print("Error")
        }
        print("Async operation completed")
    }
    
    // With Task.Yield
    func withYield() async {
        print("Task B: Start withYield")
        await performAsyncOperationWithYield()
        print("Task B: End withYield")
    }

    func performAsyncOperationWithYield() async {
        await Task.sleep(2 * 1_000_000_000) // Sleep for 2 seconds
        print("Async operation completed with yield")
        await Task.yield() // Yield control explicitly
        print("Resumed after yield")
    }

    //MARK: 3 Async with Throws
    func listPhotos(inGallery name: String) async throws -> [String] {
        try await Task.sleep(for: .seconds(2))
        return ["IMG001", "IMG99", "IMG0404"]
    }

}

//MARK: 4 Async Sequence
struct MyAsyncSequence: AsyncSequence {
    typealias Element = Int

    struct AsyncIterator: AsyncIteratorProtocol {
        var current = 0

        mutating func next() async throws -> Int? {
            defer { current += 1 }
            return current < 5 ? current : nil
        }
    }

    func makeAsyncIterator() -> AsyncIterator {
        return AsyncIterator()
    }
}
