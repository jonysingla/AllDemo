//
//  DictionaryVC.swift
//  TestApp
//
//  Created by Jony on 07/12/23.
//

import UIKit

class DictionaryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example Dictionary Syntax
        // [Key: value]
        
        // Example 1 -- Create an empty dictionary with type annotation
        var namesOfIntegers : [Int : String] = [:]
//        print("namesOfIntegers -- ", namesOfIntegers)

        // Empty dictionary with type inference
        var emptyDict = [String: Int]()
        
        // Example 2 assign value dictionary
        namesOfIntegers[16] = "Sixteen"
//        print("namesOfIntegers -- ", namesOfIntegers)
        
        // Example 3 Creating a Dictionary with a Dictionary Literal
        var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//        print("airports -- ", airports)

        // Example 4 Accessing elements dictionary
//        print("The airports dictionary contains \(airports.count) items.")
        
//        if airports.isEmpty {
//            print("The airports dictionary is empty.")
//        } else {
//            print("The airports dictionary isn't empty.")
//        }
        
        // Using the `contains` method
        if airports.contains(where: { $0.key == "DUB" }) {
//            print("The key 'DUB' exists")
        }
        
        // Example 4 Adding new elements in dictionary
        airports["LHR"] = "London"
//        print("The airports dictionary contains \(airports.count) items.")
        
        // Example 5 Update new elements in dictionary
        airports["LHR"] = "London Heathrow"
//        print("The airports dictionary contains \(airports.count) items.")
//        print("airports -- ", airports)
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
//            print("The old value for DUB was \(oldValue).")
        }
//        print("airports -- ", airports)
        
        
        // Example 6 -- Remove value in Dictionary assign Nil
//        airports["LHR"] = nil
//        print("airports -- ", airports)
        
        // Example 7 -- Remove value in Dictionary using remove key
//        if let removedValue = airports.removeValue(forKey: "DUB") {
//            print("airports -- ", airports)
//            print("The removed airport's name is \(removedValue).")
//        } else {
//            print("The airports dictionary doesn't contain a value for DUB.")
//        }
        
        //Example 8 Iterating Over a Key value pair
        for (airportCode, airportName) in airports {
//            print("\(airportCode): \(airportName)")
        }
        
        // Iteration over key
        for (airportCode) in airports.keys {
//            print("\(airportCode)")
        }
        
        // Iteration over key
        for (airportName) in airports.values {
//            print("\(airportName)")
        }
    }
}
