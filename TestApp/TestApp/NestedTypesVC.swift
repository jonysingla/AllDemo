//
//  NestedTypesVC.swift
//  TestApp
//
//  Created by Jony on 16/01/24.
//

import UIKit

class NestedTypesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Example 1: Struct nested types calling
        var outerInstance = OuterStruct(outerProperty: 42)

        // Accessing nested struct
        var innerStructInstance = OuterStruct.InnerStruct(innerProperty: "Hello")

        // Accessing nested enum
        var innerEnumValue = OuterStruct.InnerEnum.caseA

        // Accessing nested class
        var innerClassInstance = OuterStruct.InnerClass(innerClassProperty: 3.14)
        
        
        //Example 2: Class nested types calling
        var outerInstanceClass = OuterClass(outerProperty: 42)

        // Accessing nested struct
        var innerStructInstanceClass = OuterClass.InnerStruct(innerProperty: "Hello")

        // Accessing nested enum
        var innerEnumValueClass = OuterClass.InnerEnum.caseA

        // Accessing nested class
        var innerClassInstanceClass = OuterClass.InnerClass(innerClassProperty: 3.14)

    }
}
//MARK: Struct nested types
struct OuterStruct {
    var outerProperty: Int

    // Nested struct
    struct InnerStruct {
        var innerProperty: String
    }

    // Nested enum
    enum InnerEnum {
        case caseA
        case caseB
    }

    // Nested class
    class InnerClass {
        var innerClassProperty: Double

        init(innerClassProperty: Double) {
            self.innerClassProperty = innerClassProperty
        }
    }
}

//MARK: Class nested types
class OuterClass {
    var outerProperty: Int

    // Nested struct
    struct InnerStruct {
        var innerProperty: String
    }

    // Nested enum
    enum InnerEnum {
        case caseA
        case caseB
    }

    // Nested class
    class InnerClass {
        var innerClassProperty: Double

        init(innerClassProperty: Double) {
            self.innerClassProperty = innerClassProperty
        }
    }

    init(outerProperty: Int) {
        self.outerProperty = outerProperty
    }
}




