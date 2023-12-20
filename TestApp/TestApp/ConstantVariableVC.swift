//
//  ConstantVariableVC.swift
//  TestApp
//
//  Created by Jony on 01/12/23.
//

import UIKit

class ConstantVariableVC: UIViewController {
    
    weak var delegate: PenguinDelegate?
//     let delegateOne: PenguinDelegate?
    var valueStringOne = "Hello"
    
    typealias helloConvertString  = String
    
    var newString = helloConvertString() // String()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        valueStringOne = 12
        
//                let constantBlog = TestMutate(name: "iOS", age: 5)
//                constantBlog.name = "android"
//                constantBlog.age = 10
//                print(constantBlog)
//                // Do any additional setup after loading the view.
        
//                var constantBlogOne = TestMutate(name: "iOS", age: 5)
//                constantBlogOne.name = "android"
//                constantBlogOne.age = 15
//                print(constantBlogOne)
            }
        //
//            func mutateValueFun(var value: Int) {
//                value += 1
//                valueStringOne = value
//            }
//    }
    
}

struct TestMutate {
    var name = String()
    var age = Int()
}


protocol PenguinDelegate: class {
    func userDidTapThePenguin()
}
