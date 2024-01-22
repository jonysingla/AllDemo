//
//  OpaqueTypeVC.swift
//  TestApp
//
//  Created by Jony on 17/01/24.
//

import UIKit

class OpaqueTypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Example 1: Opaque Type
        func getAnimal() -> some Animal {
            return Dog()
        }
        
        //Example 2: Opaque type with Generic
        // Generic function with an opaque return type
//        let shape1 = drawRandomShape(flag: true)
//
//        // Example usage
////        let shape1 = drawRandomShape(flag: true)
////        let shape2 = drawRandomShape(flag: false)

//        print(shape1.draw())  // Output: Drawing a Circle
//        print(shape2.draw())  // Output: Drawing a Square
    }
    
//    func drawRandomShape<T: ShapeOpaque>(flag: Bool) -> some ShapeOpaque {
//        if flag {
//            return CircleOpaque()
//        } else {
//            SquareOpaque()
//        }
////            return flag ? CircleOpaque() : SquareOpaque()
//    }
}
//MARK: 1 Opaque Type
protocol Animal {
    func makeSound() -> String
}

struct Dog: Animal {
    func makeSound() -> String {
        return "Woof"
    }
}

struct Cat: Animal {
    func makeSound() -> String {
        return "Meow"
    }
}

////MARK: 2 Opaque type with Generic
//protocol ShapeOpaque {
//    func draw() -> String
//}
//
//struct CircleOpaque: ShapeOpaque {
//    func draw() -> String {
//        return "Drawing a Circle"
//    }
//}
//
//struct SquareOpaque: ShapeOpaque {
//    func draw() -> String {
//        return "Drawing a Square"
//    }
//}

