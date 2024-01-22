//
//  AssociatedTypeVC.swift
//  TestApp
//
//  Created by Jony on 22/01/24.
//

import UIKit

class AssociatedTypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Example 1: Associatetype types with Generic
        var intContainer = IntContainer()
        intContainer.addItem(42)

        var stringContainer = StringContainer()
        stringContainer.addItem("Hello, Swift!")

        print(intContainer.getItem(at: 0) as Any)      // Output: Optional(42)
        print(stringContainer.getItem(at: 0) as Any)   // Output: Optional("Hello, Swift!")
        
        //Example 2:  Generic Associated Type Protocol with Stack
        var intStack = IntStackAssociatedType()
        intStack.push(42)
        intStack.push(10)

        print(intStack.peek() as Any)  // Output: Optional(10)
        print(intStack.pop() as Any)   // Output: Optional(10)
        
        //Example 3: Extending an Existing Type to Specify an Associated Type
        var intArray: [Int] = [1, 2, 3]
        intArray.addItem(4)

        var stringArray: [String] = ["apple", "orange", "banana"]
        stringArray.addItem("grape")

        print(intArray.getItem(at: 3)as Any)      // Output: Optional(4)
        print(stringArray.getItem(at: 2)as Any)   // Output: Optional("banana")

        //Example 4: Adding Constraints to an Associated Type -- Equatable Protocol -- Error in pgm
//        print(intContainer.containsItem(42))  // Output: true
//        print(stringContainer.containsItem("Swift"))
        
        //Example 5: Using a Protocol in Its Associated Type’s Constraints

        
    }
}

//MARK: 1 Generic Associated Type Protocol
protocol Container {
    associatedtype Item                     // Here we are creating associatedtype protocol with generic
    var count: Int { get }
    mutating func addItem(_ item: Item)
    func getItem(at index: Int) -> Item?
}

// Conforming Associated type with Int as the associated type
struct IntContainer: Container {
    typealias Item = Int
    var items: [Item] = []

    var count: Int {
        return items.count
    }

    mutating func addItem(_ item: Item) {
        items.append(item)
    }

    func getItem(at index: Int) -> Item? {
        guard index < items.count else { return nil }
        return items[index]
    }
}

// Conforming Associated type with String as the associated type
struct StringContainer: Container {
    typealias Item = String
    var items: [Item] = []

    var count: Int {
        return items.count
    }

    mutating func addItem(_ item: Item) {
        items.append(item)
    }

    func getItem(at index: Int) -> Item? {
        guard index < items.count else { return nil }
        return items[index]
    }
}

//MARK: 2 Generic Associated Type Protocol with Stack
protocol StackAssociatedType {
    associatedtype Element

    var isEmpty: Bool { get }
    var count: Int { get }

    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
}

struct IntStackAssociatedType: StackAssociatedType {          // Same program will work for string also only change data type int to string as same like above pgm
    typealias Element = Int

    private var elements: [Element] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    mutating func push(_ element: Element) {
        elements.append(element)
    }

    mutating func pop() -> Element? {
        return elements.popLast()
    }

    func peek() -> Element? {
        return elements.last
    }
}

//MARK: 3 Extending an Existing Type to Specify an Associated Type
extension Array : Container {
    typealias Item = Element                    // Don't know where get this element
    
    mutating func addItem(_ item: Item) {
        self.append(item)
    }
    
    func getItem(at index: Int) -> Item? {
        guard index >= 0, index < self.count else {
            return nil
        }
        return self[index]
    }
}

//MARK: 4 Adding Constraints to an Associated Type -- Equatable Protocol
//extension Container where Item: Equatable {
//    func containsItem(_ item: Item) -> Bool {
//        return items.contains(item)
//    }
//}

//MARK: 5 Using a Protocol in Its Associated Type’s Constraints
// Not understand pgm where it's used

