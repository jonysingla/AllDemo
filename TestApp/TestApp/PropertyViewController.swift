//
//  PropertyViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class PropertyViewController: UIViewController {
    
    
    // Example 14 -- Global Variable
    @CapitalNameValue var globalVar: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Example 1 -- Stored Property
        var obj : Int
        let objOne : String
        
        //Example 2 -- Stored property with default value
        var objTwo : Int = 10
        var objThree : String = "Hello"
        
        //Example 3 --Modify default value of property
        objTwo = 30
        objThree = "Hi"
        
        //Example 4 -- Calling Assign constant properties during initaliation
        var objTestInitalizerWithout = TestInitalizatierWithout()
//        objTestInitalizerWithout.objTest = "Hello"        // Giving error becuase we can't initalize value or we can change let to var.
        objTestInitalizerWithout.objTestOne = "Test ---"
        
//      Calling Assign constant properties during initaliation -- Here we can change let value
        var testInitializer = TestInitalizatier(objTest: "Hi --", objTestOne: "Hello")
        testInitializer.printValue()
        
        // Example 5 -- Calling Stored Properties of Constant Structure Instances
        let testInitalizaierStruct = TestInitalizaierStruct(objTest: "delhi", objTestOne: "Noida")
//        testInitalizaierStruct.objTestOne = "GHB" // Error because testInitalizatierStruct is constant if we change this to var then working.
        
        var testInitalizaierStructNew = TestInitalizaierStruct(objTest: "delhi", objTestOne: "Noida")
        testInitalizaierStructNew.objTestOne = "GHB" // Working
        
        // ----- With Class above example
        let testInitalizaierClass = TestInitalizaierClass()
        testInitalizaierClass.objTestOne = "Hell testing"
        
        //Example 6 -- Calling Lazy Property
        var objCar = Car()
        print(objCar.brand) // Memory allocated here
        
        // Example 7 -- Calling Computed Property
        var objComputedProp = ComputedProperty(width: 50.0, height: 40.0)
        print("Computed Property", objComputedProp.area)
        
        // Example 8 -- Calling Property Observer
        var objPropertyObserver = PropertyObserver()
        objPropertyObserver.name = "Hi"
        
        // Example 9 -- Copy-in copy out parameter (In-out Parameter)
        var x = 7
        someFunction(a: &x)
        print(x)  // Prints "8"

        // Example 10 -- Property Wrapper without initializer
        @CapitalName var objName : String
        objName = "hello"
        print(objName)
        
        // Example 11 -- Property Wrapper with initializer
        @CapitalNameValue var objNameValue : String
//        objNameValue = "hello"
        print(objNameValue)
        
        //Example 12 -- Projected Value
        var someStructure = SomeStructure()
        someStructure.someNumber = 4
        print(someStructure.$someNumber)
        // Prints "false"
        
        someStructure.someNumber = 55
        print(someStructure.$someNumber)
        // Prints "true"
        
//        @CapitalNameProjectedValue var objNameProj : String
//        objNameProj = "test"
//
//        print("objNameProj",objNameProj)
//        print("", $objNameProj)
//
//        var someStructure = SomeStructure()
//        someStructure.nameTest = "test"
        
//        print("objNameProj",someStructure.nameTest)
//        print(someStructure.$nameTest)
        
  
       // Example 13 -- Local Variable
        func exampleFunction() {
            @CapitalNameValue var localVar: String = ""
            // ...
        }
        
        // Example 14 -- Global Variable
        
        // Example 15 -- Calling Type Property -- Static --  Accessing type properties
       
        print(TypeProperty.someTypeProperty)    // Output: 42

        TypeProperty.someTypeProperty = 100
        print(TypeProperty.someTypeProperty)    // Output: 100

        print(TypeProperty.computedTypeProperty) // Output: 100.0

        TypeProperty.computedTypeProperty = 3.14
        print(TypeProperty.someTypeProperty)    // Output: 3

        // Example 16 -- Querying type property
        struct SomeStruct {
            static var someTypeProperty: Int = 42
        }

        // Querying the type property
        let value = SomeStructQuerying.someTypeProperty
        print(value)  // Output: 42

        // Example 17 Setting type property
        struct SomeStructQuerying {
            static var someTypeProperty: Int = 42
        }

        // Setting the type property
        SomeStructQuerying.someTypeProperty = 100

        // Querying the updated value
        let updatedValue = SomeStruct.someTypeProperty
        print(updatedValue)  // Output: 100
        
        

        
        

        
        //Weak property
        var objAccountHolderName = AccountHolderName()
        objAccountHolderName.objName?.accountHolderName = "Jony"
        
                
    }
    //MARK: Copy-in copy out (In-Out Parameter)
    func someFunction(a: inout Int) {
        a += 1
    }

}



//MARK: Assigning Constant Properties without During Initialization
class TestInitalizatierWithout {
    let objTest : String = ""
    var objTestOne : String = ""
   
    func printValue(){
        print(objTest, objTestOne)
    }
}

//MARK: Assigning Constant Properties During Initialization
class TestInitalizatier {
    let objTest : String
    var objTestOne : String
    init(objTest: String, objTestOne: String) {
        self.objTest = objTest
        self.objTestOne = objTestOne
    }
    func printValue(){
        print(objTest, objTestOne)
    }
}

//MARK: Stored Properties of Constant Structure Instances
struct TestInitalizaierStruct {
    let objTest : String
    var objTestOne : String
}

class TestInitalizaierClass {
    let objTest : String = ""
    var objTestOne : String = ""
}

//MARK: Lazy property
class Car {
    lazy var brand: String = "BMW"
}
//MARK: Computed Property default getter and setter
struct ComputedProperty {
    let width : Double
    let height : Double
    
    var area : Double {
        width * height
    }
}

//MARK: Computed Property using getter and setter -- We can't use immutable (Constant) property we can use only mutable property
struct ComputedPropertyWithGetterSetter {
    var width : Double
    var height : Double
    
    var area : Double {
        get {
            width * height          // Shorthand Getter Declaration without return
//            return width * height // Read-Only Computed Properties but we can remove setter function below then it work
        }
        set {
            // Assuming a square aspect ratio
            width = sqrt(newValue)          // Shorthand Setter Declaration with newValue keyword
            height = sqrt(newValue)
        }
    }
}

//MARK: Property Observer
class PropertyObserver {
    var name: String  = "Hello" {
        willSet {
            print("Will set Property Observer", newValue)
        }
        didSet {
            print("Did set Property Observer", oldValue)
        }
    }
}

//MARK: Property Wrapper
@propertyWrapper struct CapitalName {
    private var name = String()
    var wrappedValue : String {
        get { return name }
        set { name = newValue.capitalized }
    }
}

//MARK: Setting initial (init) value for Wrapped property
@propertyWrapper struct CapitalNameValue {
    private var name: String = ""
    
    var wrappedValue : String {
        get { return name }
        set { name = newValue.capitalized }
    }
    
    init(wrappedValue: String = "test") { // We can pass default value anywhere
        name = wrappedValue.capitalized
    }
}
//MARK: Projected Value property wrapper
/*@propertyWrapper                          // this example showing a problem with $symbol
struct CapitalNameProjectedValue {
    private var name : String
    private(set) var checkNameLength : Bool
    
    var wrappedValue : String {
        get { return name }
        set {
            name = newValue.capitalized
            if (name == "") {
                checkNameLength = false
            } else {
                checkNameLength = true
            }
        }
    }
    
    init() {
            self.name = ""
            self.checkNameLength = false
        }
}

struct SomeStructure {
    @CapitalNameProjectedValue var nameTest: String
}*/

@propertyWrapper
struct SmallNumber {
    private var number: Int
    private(set) var projectedValue: Bool
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }

    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructure {
    @SmallNumber var someNumber: Int
}
//MARK: Type Property (Static)
struct TypeProperty {
    // Type property with a default value
    static var someTypeProperty: Int = 42

    // Type property with a getter and setter
    static var computedTypeProperty: Double {
        get {
            return Double(someTypeProperty)
        }
        set {
            someTypeProperty = Int(newValue)
        }
    }
}






//MARK: Weak Property
class BankAccount {
    var accountHolderName = String()
}

class AccountHolderName {
     weak var objName : BankAccount?
}

//MARK: Unowned Property
class Apartment {
    var tenant : Owner?
}

class Owner {
    unowned var resindence : Apartment?
    init(resindence: Apartment? = nil) {
        self.resindence = resindence
    }
}
//MARK: Static Property -- Also Called Type Property
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"

    var name: String
    var age: Int
}
