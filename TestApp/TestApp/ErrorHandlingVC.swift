//
//  ErrorHandlingVC.swift
//  TestApp
//
//  Created by Jony on 04/01/24.
//

import UIKit

class ErrorHandlingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Example 1 -- Propagating error using Throwing Function with do cath
        do {
            let result = try divide(10, by: 3)
            print("Result: \(result)")
        } catch CustomError.invalidInput {
            print("Invalid input: Denominator cannot be zero.")
        } catch CustomError.operationFailed(let reason) {
            print("Operation failed: \(reason)")
        } catch {
            print("An unexpected error occurred.")
        }
        
        // Example 2 -- with try
        do {
            try topLevelFunction()
        } catch {
            print("Error caught at the top level: \(error)")
        }
        
        func topLevelFunction() throws {
            // You can call the throwing function here and let the error propagate
            try performDivision(10, by: 2)
        }
        
        // Example 3 -- Converting error to Optional Values
        let result1 = try? divide(10, by: 2)  // Result: Optional(5)
        let result2 = try? divide(10, by: 0)  // Result: nil

        // Handling optional values
        if let unwrappedResult1 = result1 {
            print("Result 1: \(unwrappedResult1)")
        } else {
            print("Result 1 is nil.")
        }
    }
}

//MARK: Propagating error using Throwing Function
enum CustomError: Error {
    case invalidInput
    case operationFailed(reason: String)
}

func divide(_ numerator: Int, by denominator: Int) throws -> Int {
    guard denominator != 0 else {
        throw CustomError.invalidInput
    }

    if numerator % denominator != 0 {
        throw CustomError.operationFailed(reason: "Result is not an integer.")
    }

    return numerator / denominator
}

//MARK: Program two with try
func performDivision(_ numerator: Int, by denominator: Int) {
    do {
        let result = try divide(numerator, by: denominator)
        print("Result: \(result)")
    } catch CustomError.invalidInput {
        print("Invalid input: Denominator cannot be zero.")
    } catch CustomError.operationFailed(let reason) {
        print("Operation failed: \(reason)")
    } catch {
        print("An unexpected error occurred.")
    }
}
