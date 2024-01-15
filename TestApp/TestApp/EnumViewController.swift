//
//  EnumViewController.swift
//  TestApp
//
//  Created by Jony on 14/12/23.
//

import UIKit

class EnumViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Example 1 -- Simple enum calling also Matching Enumeration Values with a Switch Statement
        let objWeather = WeatherType.sun
        print("Status of cloud", getWeatherStatus(weather: objWeather))
//        getHaterStatus(weather: WeatherType.cloud)
        
        //Example 2 -- Calling With Computed property using enum
        print("With Computed Property", WeekdayWith.sunday.days)
        
        //Example 3 -- Calling Without Computed property using enum using instance function
        print("Without Computed Property", WeekdayWithout.monday.dayType())
        
        //Example 4 -- Calling Using the initializers
        let colorValue = ColorWithInitalizatier()
        print("colorValue", colorValue)
        
        let colorName = ColorWithInitalizatier(colorName: "Green")
        print("colorName", colorName)
        
        //Example 5 -- Iteration in enum
        for enumIteration in WeatherTypeIteration.allCases {
            print("Found it", enumIteration)
        }
        
        //Example 6 -- Calling Associated value
        let marksGPA = Marks.gpa(2.3, 4.5, 5.6)
        let marksGrade = Marks.grade("A", "B", "C")
        print("marksGPA",marksGPA)
        print("marksGrade",marksGrade)
        
        //Example 7 -- Calling Named Associate Value
        let namedObj = Pizza.medium(inches: 12)
        print("namedObj", namedObj)
        
        //Example 8 -- calling Raw value
        print("Bike -- ",VehicleType.bike)
        print("Car -- ",VehicleType.car)
        
        //Example 9 -- Calling Implictly Assigned raw value
        var detailMonth = Month.August.rawValue
        print(detailMonth)
        
        //Example 10 -- Calling Initializing from a Raw Value
        let objRaw = MonthInitializing(rawValue: 6)
        print("Raw Value retrive",objRaw)
        
        //Example 11 -- Calling Recursive Operation
        let expression1 = ArithmeticExpression.number(5)
        let expression2 = ArithmeticExpression.number(3)
        let sum = ArithmeticExpression.addition(expression1, expression2)
        let product = ArithmeticExpression.multiplication(expression1, sum)
        
        // Evaluation function for arithmetic expressions
        func evaluate(_ expression: ArithmeticExpression) -> Int {
            switch expression {
            case let .number(value):
                return value
            case let .addition(left, right):
                return evaluate(left) + evaluate(right)
            case let .multiplication(left, right):
                return evaluate(left) * evaluate(right)
            }
        }

        // Evaluating the expressions
        print(evaluate(expression1))    // Output: 5
        print(evaluate(sum))            // Output: 8
        print(evaluate(product))        // Output: 40
    }
    
    // Example 11 -- without @unknown default
    enum withoutUnkwonOption {
        case A
        case B
    }
    //
    func optionSelectedWithout(option: withoutUnkwonOption) {
        switch(option) {
        case .A:
            print("You chose A!")
        default:
            print("All case not exhauted")
        }
    }
    
    // Example 12 -- with @unknown default
    enum withUnkwonOption {
        case C
        case D
    }
    //
    func optionSelectedWith(option: withUnkwonOption) {
        switch(option) {
        case .C:
            print("You chose A!")
        @unknown default:
            print("All case not exhauted")
        }
    }

    //Simple enum function declartion
    func getWeatherStatus(weather: WeatherType) -> String {
        if weather == WeatherType.rain {
            return "awesome weather"
        } else if weather == WeatherType.snow {
            return "very pleasent"
        } else {
            return "nothing"
        }
    }
}

//MARK: enum Syntax
enum SomeEnumeration {
    // enumeration definition goes here
}

//MARK: Simple enum
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
    
//    Multiple cases can appear on a single line, separated by commas:
//    case sun, cloud, rain, wind, snow
}

//MARK: Without Computed property using enum, using instance function
enum WeekdayWithout {
    case sunday
    case monday
    case tuesday
    
    func dayType() -> String {
        switch self {
        case .monday, .tuesday:
            return  "Weekday"
        case .sunday:
            return "Weekend"
        default:
            return "Nothing available"
        }
    }
}

//MARK: With Computed property using enum
enum WeekdayWith {
    case sunday
    case monday
    case tuesday
    
    var days: String {
        switch self {
        case .monday, .tuesday:
            return  "Weekday"
        case .sunday:
            return "Weekend"
        default:
            return "Nothing available"
        }
    }
}

//MARK: Initalizer to provide inital base value in enum
enum ColorWithInitalizatier {
    case rgb(red: Int, green: Int, blue: Int)
    case named(color: String)
    
    // Initializer to set an initial case value with default color
    init() {
        self = .rgb(red: 0, green: 0, blue: 0)
    }
    
    // Initializer to initialize the named case with a default color
    init(colorName: String) {
        self = .named(color: colorName)
    }
}


//MARK: Iteration in enum using key CaseIterable
enum WeatherTypeIteration: CaseIterable {
    case sun
    case cloud
    case rain
    case wind
    case snow
    
//    Multiple cases can appear on a single line, separated by commas:
//    case sun, cloud, rain, wind, snow
}

//MARK: Associate Value
enum Marks {
    case gpa(Double, Double, Double)
    case grade(String, String, String)
}

//MARK: Named Associate Values
enum Pizza {
    // named associated value -- inches called as Named associate value
    case small (inches: Int)
    case medium (inches: Int)
    case large (inches: Int)
}

//MARK: Raw value
enum VehicleType : String {
    case bike = "Two Wheeler"
    case car = "FourWheeler"
}

//MARK: Implictly Assigned Raw Value
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December;
}

//MARK: Initializing from a Raw Value
enum MonthInitializing: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December;
}

//MARK: Recursive Enumerations
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

