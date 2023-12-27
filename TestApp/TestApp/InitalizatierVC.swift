//
//  InitalizatierVC.swift
//  TestApp
//
//  Created by Jony on 11/12/23.
//

import UIKit

class InitalizatierVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //MARK: 1 Initializer Syntax also called instance method without parameter
        //init() {
        // // perform some initialization here
        //}
        
        //MARK: 2 Initializer with one property Calling
        var f = Fahrenheit()
        print("The default temperature is \(f.temperature)° Fahrenheit")
        
        //MARK: 3 Default Value Calling
        var fahrenheitStore = FahrenheitStore()
        print("The default temperature is \(fahrenheitStore.temperature)° Fahrenheit")
        
        //MARK: 4 Initalization parameter Calling
        let boilingPointOfWater = Celsius(fromFahrenheit: 440.0)
        let freezingPointOfWater = Celsius(fromKelvin: 450.15)
        
        //MARK: 5 Parameter name and argument label -- Initalizer automatically takes argument name if we can't declare
        let boilingPointOfWaterWithout = CelsiusWithoutinitalizer(fahrenheit: 420.0)
        let freezingPointOfWaterWithout = CelsiusWithoutinitalizer(kelvin: 430.0)
        
        //MARK: 6 Initializer parameter without argument lables (Omitting parameter _ ) Calling
        let initOmitting = CelsiusWithOmitting(340.0)
        let freezOmitting = CelsiusWithOmitting(343.0)
        
        //MARK: 7 Optional Property Type calling
        var objSurvey = SurveyQuestion()
        objSurvey.response = "Hello"
        
        //MARK: 8 Assigning constant property during initialization -- only change in class case not in struct
        let surveyQuestionConstant = SurveyQuestionConstant(text: "Hello")
        print("Default constant ",surveyQuestionConstant.text)
        
        //MARK: 9 Default initalizer calling
        var item = ShoppingListItem()
        
        //MARK: 10 Memberwise (Copy) initalizers for structure types Calling -- Deep Copy
        let twoByTwo = Size(width: 2.0, height: 2.0)
        print("twoByTwo", twoByTwo.width, twoByTwo.height)
        
        //MARK: 11 Initalizer delegation for value types calling
        let basicRect = Rect()
        let originRect = Rect(origin: PointOne(x: 2.0, y: 3.0), size: SizeOne(width: 5.0, height: 5.0))
        print("basic Rect", basicRect.origin, basicRect.size)
        print("origin Rect", originRect.origin, originRect.size)
        
        //MARK: 12 -- Designated Initalizer calling
        let person = PersonDesignated(name: "Jony")
        print("person name", person.name)
        
        //MARK: 13 -- Conveniced Initalizer call
        let personConv = PersonConveniced(name: "hi")
        print("person name", personConv.name)
        
        //MARK: 14 -- Initializer Inheritance and Overriding -- Child class can inherit all super class property
        // Three example below
        var childPerson = ChildPerson()
        childPerson.name = "Sumit"
        childPerson.age = 34
        print("childern name", childPerson.name)
        print("childern name", childPerson.age)
        
        //MARK: 15 -- Designated and convenience & Automatic initializer in action
        let namedMeat = Food(name: "Bacon")
        print("namedMeat",namedMeat.name)
        
        let namedMeatWithout = Food()               // Calling convenience method
        print("namedMeat",namedMeatWithout.name)
        
        // Automatic initializer
        var shoppingDetail = ShoppingDetail()
        print("shoppingDetail",shoppingDetail.name)
        
        //MARK: 16 Failable initializer calling
        let objFailable = FailableInitalizatier(id: "tesfdsfdsfdst")
        print("objFailable", objFailable?.id)
        
        //MARK: 17 -- can’t define a failable and a nonfailable initializer with the same parameter types and names
//        Example below
        
        //MARK: 18 -- init(exactly:)
        let wholeNumber: Double = 12345.0
        let pi = 3.14159
        if let valueMaintained = Int(exactly: wholeNumber) {
            print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
        }
        // Prints "12345.0 conversion to Int maintains value of 12345"

        let valueChanged = Int(exactly: pi)                         // Don't understand why this will return nil
        // valueChanged is of type Int?, not Int

        if valueChanged == nil {
            print("\(pi) conversion to Int doesn't maintain value")
        }
        // Prints "3.14159 conversion to Int doesn't maintain value"

        //MARK: 19 -- Failable Initializers for Enumerations calling
        let fahrenheitUnit = TemperatureUnit(symbol: "F")
        if fahrenheitUnit != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }

        let unknownUnit = TemperatureUnit(symbol: "X")
        if unknownUnit == nil {
            print("This isn't a defined temperature unit, so initialization failed.")
        }
        
        //MARK: 20 -- Failable Initializer with enumeration with raw value calling
        let fahrenheitUnitRawValue = TemperatureUnitRawValue(rawValue: "F")
        if fahrenheitUnitRawValue != nil {
            print("This is a defined temperature unit, so initialization succeeded.")
        }

        let unknownUnitRawValue = TemperatureUnitRawValue(rawValue: "X")
        if unknownUnitRawValue == nil {
            print("This isn't a defined temperature unit, so initialization failed.")
        }
        
        // MARK: 21 -- Overriding a Failable Initializer
        //Example below
        
        // MARK: 22 -- The init! Failable Initializer
        let validNumber = MyNumber(stringValue: "42")
        let invalidNumber = MyNumber(stringValue: "abc")

        // Unwrapping the optional result
        if let validValue = validNumber?.value {
            print("Valid Number: \(validValue)")
        } else {
            print("Invalid Number")
        }

        if let invalidValue = invalidNumber?.value {
            print("Invalid Number: \(invalidValue)")
        } else {
            print("Invalid Number")
        }
        
        // MARK: 23 -- Required Initalizer
        let carValue = CarValue(color: "Black")
        print("Car Value", carValue.color)
        print("Car Value", carValue.carName)
        
        // MARK: 24 -- Setting a Default Property Value with a Closure or Function Calling
        let circle = Circle(radius: 3.0)
        print("Radius: \(circle.radius), Area: \(circle.area)")
        
        
                
    }
}

//2 -- Initializer with one store property
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

//3 -- Default value
struct FahrenheitStore {
    var temperature = 34.0
}

//4-- Initialization Parameter or we can say multiple initializer
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

//5 -- Initalizer without argument name
struct CelsiusWithoutinitalizer {
    var temperatureInCelsius: Double
    init(fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

// 6 -- Initalizer without argument name (Omitting)
struct CelsiusWithOmitting {
    var temperatureInCelsius: Double
    init(fahrenheitOmitting: Double) {
        temperatureInCelsius = (fahrenheitOmitting - 32.0) / 1.8
    }
    init(_ kelvinOmitting: Double) {
        temperatureInCelsius = kelvinOmitting - 273.15
    }
    
//    init(_ kelvinOmittingOne: Double) {                      // Error we can't use initializing multiple omitting parameter
//        temperatureInCelsius = kelvinOmittingOne - 273.15
//    }
}

// 7 --  Optional property type
class SurveyQuestion {
    var response: String?
}

// 8 -- Constant
class SurveyQuestionConstant {
    let text: String
    init(text: String) {                            // Also called Custom initializer
        self.text = text
    }
}

//class SurveyQuestionChild : SurveyQuestionConstant {
//    let text: String                                          // Error subclass can't override parent class constant
//    init(text: String) {                                      // Error subclass can't override parent class constant
//        self.text = text
//    }
//}

// 9 -- Default initalizer
class ShoppingListItem {
    var name: String?           //  Default nil
    var quantity = 1            //  Default int
    var purchased = false       //  Default bool
}

// 10 -- Memberwise (Copy) initalizers for structure types
struct Size {
    var width = 0.0, height = 0.0
}

// 11 -- Initializer delegation for value type --
struct SizeOne {
    var width = 0.0, height = 0.0
}
struct PointOne {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = PointOne()
    var size = SizeOne()
    init() {}
    init(origin: PointOne, size: SizeOne) {
        self.origin = origin
        self.size = size
    }
    init(center: PointOne, size: SizeOne) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: PointOne(x: originX, y: originY), size: size)
    }
}

// 12 -- Designated Initializers
class PersonDesignated {
    var name : String
    init(name: String) {
        self.name = name
    }
}


//13 -- Conveniced Initalizer
class PersonConveniced {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        // Calls the designated initializer with default age
        self.init(name: name, age: 23)
    }
}

// 14 -- Initializer Inheritance and Overriding
// Example 14.1 --
class Person {
    var name : String
    init(name: String) {
        self.name = name
    }
}

class ChildPerson : Person {
    var age : Int
    init(age: Int = 20) {
        self.age = age
        super.init(name: "test")        // Error -- If we can't use this then it's showing error -- 'super.init' isn't called on all paths before returning from initializer
    }
}

// Example 14.2 -- Without child class Automatic initialization property
class ChildTwo : Person {
    override init(name: String) {
        super.init(name: name)
    }
}

// Example 14.3 --
class ChildThree : Person {
    var dob : Int = 10
    init(dob: Int) {
        self.dob = dob
        super.init(name: "test123")
    }
    // Error -- not working on my end -- 'super.init' isn't called on all paths before returning from initializer
//        override init() {
//                super.init()
//                name = "Test"
//            }
    
}

// Example 15 -- Designated and convenience & Automatic initializer in action
// Example 15.1
class Food {
    var name: String
    init(name: String) {                    // designated initializer
        self.name = name
    }
    convenience init() {                    // convenience initializer,
        self.init(name: "[Unnamed]")
    }
}
// Example 15.2 automatic initializer
class ShoppingDetail : Food {
    override init(name: String) {
        super.init(name: name)              // Called convenience initalizer
//        super.init(name: "testeewrerwe")
    }
}

// Example 16 Failable Initalizer
class FailableInitalizatier {
    var id: String
    init?(id: String) {
        if id.count >= 8 {
            self.id = id
        } else {
            return nil              // Here we can't return parameter name / value, only we can return nil, because initializer can't return value.
        }
    }
}

// Example 17 -- can’t define a failable and a nonfailable initializer with the same parameter types and names
class MyClass {
    var value: Int

    init(value: Int) {
        self.value = value
    }

    // Error: Cannot redefine 'init' with a type different from that declared before
//    init?(value: Int) {
//        // Some implementation
//    }
}

// Example 19 -- Failable Initializers for Enumerations
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

//Example 20 -- Failable Initializer with enumeration with raw value calling
enum TemperatureUnitRawValue: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

// Example 21 -- Overriding a Failable Initializer
class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {                   // initializer with a nonfailable init(name:) initializer.
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}
// Overriding a Failable Initializer with forced unwrapping
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

// Example 22 -- The init! Failable Initializer
class MyNumber {
    var value: Int

    // Failable initializer using init!
    init!(stringValue: String) {
        if let intValue = Int(stringValue) {
            self.value = intValue
        } else {
            // Return nil for invalid string representations
            return nil
        }
    }
}

//Example 23 -- Required Initalizer
// Syntax

class SomeClassRequired {
    required init() {
        // initializer implementation goes here
    }
}

class SomeSubclass: SomeClassRequired {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}
// Example
class Vehicle {
    var color: String
    
    // Required initializer
    required init(color: String) {
        self.color = color
    }
}

class CarValue : Vehicle {
    var carName: String
    
    // Subclass must implement the required initializer
    required init(color: String) {
        self.carName = "Audi"
        super.init(color: color)
    }
}

// Example -- Setting a Default Property Value with a Closure or Function
struct Circle {
    var radius: Double
    var area: Double

    // Using a closure to compute the default value for 'area'
    init(radius: Double) {
        self.radius = radius
        self.area = {
            // Closure that computes the area based on the radius
            return Double.pi * radius * radius
        }()
    }
}






