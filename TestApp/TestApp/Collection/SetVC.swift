//
//  SetVC.swift
//  TestApp
//
//  Created by Jony on 05/12/23.
// https://www.programiz.com/swift-programming/sets

import UIKit

class SetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Example -- Empty Set
        var emptySet = Set<Int>()
        print("Set:", emptySet)

        //Example 1 --  Create a Set in Swift
        var studentID : Set = [112, 114, 116, 118, 115]
//        print("Student ID: \(studentID)")
        
        //Example 2 --  specify the type of set
        var studentIDOne : Set<Int> = [112, 114, 115, 116, 118]
//        print("Student ID: \(studentIDOne)")
        
        //Example 3 -- Add Elements to a Set
        studentIDOne.insert(32)
//        print("Student ID: \(studentIDOne)")

        //Example 4 -- Remove an Element from a Set
        studentIDOne.remove(115)
//        print("Student ID: \(studentIDOne)")
        
        //Example 5 -- Iterate Over a Set
        for student in studentIDOne {
//          print(student)
        }
        
        //Example 6 -- count property to find the number of elements present in a Set
//        print("Total Elements: \(studentIDOne.count)")
        
        //Example 7 -- Union of Two Sets
//        let setA: Set = [1, 3, 5,6,7]
//        let setB: Set = [0, 2, 4,3]
//        print("Union: ", setA.union(setB))
        
        //Example 8 -- intersection() method to perform the intersection between two sets
//        print("Intersection: ", setA.union(setB))
        
        //Example 9 -- Difference between Two Sets -- subtracting() method to perform the difference between two sets
//        print("Subtraction: ", setA.subtracting(setB))
        
        //Example 10 -- Symmetric Difference between Two Sets
//        print("Symmetric Difference: ", setA.symmetricDifference(setB))
        
        //Example 11 -- Check Subset of a Set
//        let setA: Set = [1, 2, 3, 5, 4]
//        let setB: Set = [1, 2]
//        print("Subset: ", setB.isSubset(of: setA))
        
        //Example 12 -- Check if two sets are equal
        let setA: Set = [1, 3, 5]
        let setB: Set = [3, 5, 1]

        if setA == setB {
          print("Set A and Set B are equal")
        }
        else {
          print("Set A and Set B are different")
        }
        
    }

}
