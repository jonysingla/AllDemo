//
//  ARCViewController.swift
//  TestApp
//
//  Created by Jony on 24/01/24.
//

import UIKit

class ARCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Example 1: ARC in ACTION
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        
        reference1 = Person(name: "John Appleseed")         //Here we are creating strong reference
        reference2 = reference1                             // Reference2 is now strong reference
        reference3 = reference1                             // Reference3 is now strong reference
        
        reference1 = nil
        reference2 = nil
        print("reference3",reference3?.name)                // Still print the result -- reference3 Optional("John Appleseed")
        reference3 = nil
        print("reference3",reference3?.name)
        
        //Example 2: Creating Strong Reference
        var john: PersonReference?
        var unit4A: ApartmentReference?
        
        john = PersonReference(name: "John Appleseed")
        unit4A = ApartmentReference(unit: "4A")
        print("john ---- ",john?.name)
        print("unit4A ------",unit4A?.unit)
        
        john?.apartmentReference = unit4A                   // Here we are creating Strong Reference
        unit4A?.tenantReference = john                      // Here we are creating Strong Reference
        
        john = nil
        unit4A = nil
        print(" john? apartmentReference ", john?.apartmentReference?.tenantReference )
        print("unit4A? tenantReference ",unit4A?.tenantReference?.name)
        
        //Example 4: Unowned Reference
        var johnCustomer: Customer?
        johnCustomer = Customer(name: "John Appleseed")
        johnCustomer!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnCustomer!)
        
        johnCustomer = nil
        
        //Example 5 -- Unowned Optional Reference
        let department = Department(name: "Horticulture")

        let intro = Course(name: "Survey of Plants", in: department)
        let intermediate = Course(name: "Growing Common Herbs", in: department)
        let advanced = Course(name: "Caring for Tropical Plants", in: department)

        intro.nextCourse = intermediate
        intermediate.nextCourse = advanced
        
        department.courses = [intro, intermediate, advanced]
        for course in department.courses {
            print("Course -- \(course.name),", "Department -- \(course.department.name),", "Next Course -- \(String(describing: course.nextCourse?.name))\n")
        }
        
        //Example 6 -- Unowned References and Implicitly Unwrapped Optional Properties
        var country = Country(name: "India", capitalName: "Delhi")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
        
    }
}

//MARK: 1 ARC in Action
class PersonARC {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
//MARK: 2 Strong Reference Cycles Between Class Instances -- Creating Strong Reference
class PersonReference {
    let name: String
    init(name: String) { self.name = name }
    var apartmentReference: ApartmentReference?
    deinit { print("\(name) is being deinitialized") }
}
//Without weak reference -- creating strong reference
/*
class ApartmentReference {
    let unit: String
    init(unit: String) { self.unit = unit }
   var tenantReference: PersonReference?
    deinit { print("Apartment \(unit) is being deinitialized") }
} */

//MARK: 3 Resolving Strong Reference Cycle Between Class Instance -- With weak reference
class ApartmentReference {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenantReference: PersonReference?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

//MARK: 4 Unowned Reference
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer?
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

//MARK: 5 Unowned Optional Reference
class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}
//MARK: 6 Unowned References and Implicitly Unwrapped Optional Properties
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}


class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
