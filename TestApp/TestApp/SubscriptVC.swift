//
//  SubscriptVC.swift
//  TestApp
//
//  Created by Jony on 26/12/23.
//

import UIKit

class SubscriptVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Subscript Syntax
        // Error subscript' functions may only be declared within a type
//        subscript(index: Int) -> Int {
//            get {
//                // Return an appropriate subscript value here.
//            }
//            set(newValue) {
//                // Perform a suitable setting action here.
//            }
//        }
        
        // Subscript Read only without get -- Implicit
//        subscript(index: Int) -> Int {
//            // Return an appropriate subscript value here.
//        }
        
        //Example 1 -- Calling Subscript without get and set
        var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
        streets[1] = "Butler"
        print(streets[1])
        
        //Calling Subscript with get and set
        var p = daysofaweek()
        print(p[0])
        p[0] = "Monday"
        print(p[0])
        
        
        //Example 2 -- Calling Subscript Dictionary without get and set
        var dictionary = ["male": "I am a male"]
        print(dictionary["male"]) // prints "I am a male"
        
        //Example 2 -- Calling Subscript Dictionary with get and set
        var dict = MyDictionary()
        dict["one"] = 1
        let valueDictionary = dict["one"]
        print(valueDictionary)
        
        //Example 3 -- Calling Subscript overloading
//        var matrix = Matrix()
//        matrix[0, 0] = 42
//        let value = matrix[0, 0]
//        print(value)
//
//        matrix[0, 0] = 50
//        let valueOverloading = matrix[0, 0]
//        print(valueOverloading)
        
        //Example 4 -- Calling Subscript option and overloading
        var matrix = Matrix(rows: 2, columns: 2)
        print("Matrix", matrix)

        //Example 5 -- Type Sunscript
        let mars = Planet[4]
        print(mars)

    }
}
//MARK: Subscript with Array Example
class daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }
}


//MARK: Subscript with Dictionary Example
struct MyDictionary {
    private var dictionary: [String: Int] = [:]

    subscript(key: String) -> Int? {
        get {
            return dictionary[key]
        }
        set(newValue) {
            dictionary[key] = newValue
        }
    }
}

//MARK: Subscript overloading Example
//struct Matrix {
//    private var elements: [[Int]] = []
//
//    subscript(row: Int, column: Int) -> Int {
//        get {
//            return elements[row][column]
//        }
//        set(newValue) {
//            elements[row][column] = newValue                      // Thread 1: Fatal error: Index out of range
//        }
//    }
//}


//MARK: Subscript option and overloading
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}


//MARK: Type Subscript
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
