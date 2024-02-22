//
//  SynthesizedProtocol.swift
//  TestApp
//
//  Created by Jony on 17/01/24.
//

import UIKit

class SynthesizedProtocol: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK: 1 Equatable Protocol with Struct
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

//MARK: 1.1 Equatable Protocol with class
//class Vector3DClass: Equatable {                                          //Error -- Type 'Vector3DClass' does not conform to protocol 'Equatable'
//    var x = 0.0, y = 0.0, z = 0.0
//}

//MARK: 1.2 Equatable Protocol with class -- given wrong result
class Vector3DClass: Equatable {
    var x : Int, y : Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    static func == (lhs: Vector3DClass, rhs: Vector3DClass) -> Bool {
        return lhs.x == rhs.y
    }
}

//MARK: 1.3 Equatable Protocol with class -- given right result
class PersonEquatableTest: Equatable {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    static func == (lhs: PersonEquatableTest, rhs: PersonEquatableTest) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

//MARK: 2 Hashable Protocol
struct PointHashable: Hashable {
    var x: Int
    var y: Int
}

//MARK: 2.1 Hasher
struct PoinHasher: Hashable {
    var x: Int
    var y: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

//MARK: 3 Comparable Protocol
enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}


//MARK: - Hashable with equtable protocol
struct PersonTest123: Hashable {
    var name: String
    var age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(age)
    }
    
    static func == (lhs: PersonTest123, rhs: PersonTest123) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}
