//
//  GenericWhereClauseVC.swift
//  TestApp
//
//  Created by Jony on 22/01/24.
//

import UIKit

class GenericWhereClauseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Example: 1 Generic with Where Clause
        let result = isEqual(42, 42)
        print(result)  // Output: true
        
        //Example: 2 Extensions with a Generic Where Clause
        let intContainerGeneric = IntContainerGeneric()
        let containsIntGeneric = intContainerGeneric.containsItemGeneric(42)
        print(containsIntGeneric)  // Output: true
        
        //Example: 3 Contextual Where Clause -- Error
        
        
        //Example: 4 Associated Types with Generic Where Clause:
        //Program in Swift Doc
        
        // Example: 5 Generic Subscript
        var earthData = GenericDictionary(data: ["name": "Earth", "population": 7500000000, "moons": 1])

        // Automatically infers return type without "as? String"
        let name: String? = earthData["name"]
        print("Name", name as Any)

        // Automatically infers return type without "as? Int"
        let population: Int? = earthData["population"]
        print("Population", population as Any)

        
    }
    //MARK: 1 Generic with Where Clause
    // Function with a generic where clause
    func isEqual<T>(_ a: T, _ b: T) -> Bool where T: Equatable {
        return a == b
    }
}

//MARK: 2 Extensions with a Generic Where Clause
// Protocol with associated type
protocol ContainerGeneric {
    associatedtype Item
    func containsItemGeneric(_ item: Item) -> Bool
}

// Protocol extension with a generic where clause
extension ContainerGeneric where Item: Equatable {
    func containsItemGeneric(_ item: Item) -> Bool {
        // Implementation using equality check
        return true
    }
}

struct IntContainerGeneric: ContainerGeneric {
    typealias Item = Int
}

//MARK: 3 Contextual Where Clause -- Error
//extension Container {
//    func average() -> Double where Item == Int {
//        var sum = 0.0
//        for index in 0..<count {
//            sum += Double(self[index])
//        }
//        return sum / Double(count)
//    }
//    func endsWith(_ item: Item) -> Bool where Item: Equatable {
//        return count >= 1 && self[count-1] == item
//    }
//}

//MARK: 5 Generic Subscript
struct GenericDictionary<Key: Hashable, Value> {
  private var data: [Key: Value]

  init(data: [Key: Value]) {
    self.data = data
  }

  subscript<T>(key: Key) -> T? {
    return data[key] as? T
  }
}
