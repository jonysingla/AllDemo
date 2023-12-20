//
//  PropertyViewController.swift
//  TestApp
//
//  Created by Jony on 10/12/23.
//

import UIKit

class PropertyViewController: UIViewController {
    
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
//        @Email var email: String
  
       
        
        
        
        
        //Computed Observer
//        var objArea = Addition(objA: 3,objB: 6)
//        print(objArea.area)
        
        
        

        
        //Weak property
        var objAccountHolderName = AccountHolderName()
        objAccountHolderName.objName?.accountHolderName = "Jony"
        
        //Static Property
                
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
    private var name: String = ""
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
//@propertyWrapper
//struct EmailValidation {
//    private var email: String
//
//    init(initialValue: String) {
//        self.email = initialValue
//    }
//
//    var wrappedValue: String {
//        get { return email }
//        set { email = newValue }
//    }
//
//    // Projected value: Indicates whether the email is valid
//    var isValidEmail: Bool {
//        return isValidEmailFormat(email)
//    }
//
//    private func isValidEmailFormat(_ email: String) -> Bool {
//        // Simple email validation logic (you may want to use a more sophisticated method)
//        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
//        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
//        return emailPredicate.evaluate(with: email)
//    }
//}
//
//
//struct User {
//    @EmailValidation
//    var email: String
//}

//struct Addition {
//
//    var objA = Int()
//    var objB = Int()
//
//    var area : Int {
//        objA + objB
//    }
//}







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
