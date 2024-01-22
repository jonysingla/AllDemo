//
//  ViewController.swift
//  TestApp
//
//  Created by Jony on 29/11/23.

import UIKit
import Foundation

class OptionalChainingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Example 1 -- Optional Chaining as an Alternative to Forced Unwrapping Calling
        let john = PersonOptional()
        print("Number of rooms optional", john.residence?.numberOfRooms)
//        print("Number of rooms force unwrapping", john.residence!.numberOfRooms) -- Error

        let johnResidence = Residence()
        print("Number of rooms optional", johnResidence.numberOfRooms)
        
//        john.residence = Residence()
        
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        
        // Example 2 -- Defining Model Classes for Optional Chaining Calling
        let address1 = Address(city: "Noida", postalCode: "201303")
        let personOptionalChaining = PersonOptionalChaining(name: "Jony", address: address1)
        
        
        // Accessing properties using optional chaining
        if let postalCode = personOptionalChaining.address?.postalCode {
            print("Postal Code: \(postalCode)")
        } else {
            print("No postal code available.")
        }
        
        // Example 3 -- Accessing Properties Through Optional Chaining Calling
        address1.city = "Chandigarh"
        address1.postalCode = "121212"
        let personOptionalChaining2 = PersonOptionalChaining(name: "Jony", address: address1)
        
        if let postalCodeOne = personOptionalChaining.address?.postalCode {
            print("Postal Code: \(postalCodeOne)")
        } else {
            print("No postal code available.")
        }
        
        // Example 4 -- Methods Through Optional Chaining calling
        let personWithAddress = PersonOptionalChaining(name: "John", address: address1)
        
        // Calling a Method through optional chaining
        let fullAddress2 = personWithAddress.address?.fullAddress()
        
        // Printing the results
        if let fullAddress2 = fullAddress2 {
            print("Full Address for John: \(fullAddress2)")
        } else {
            print("John has no address.")
        }
        
        // Example 5 -- Accessing Subscripts Through Optional Chaining Calling
        let address4 = AddressSubscripts(streets: ["123 Main St", "456 Side St"])
        let personWithAddresses = PersonSubscripts(name: "John", addresses: [address4])

        // Accessing subscripts through optional chaining
        let street1 = personWithAddresses.addresses?[0].streets[0]
        let street2 = personWithAddresses.addresses?[0].streets[1]
        // let street1 = personWithAddresses.addresses?[1].streets[1] -- Index out of range error.

        // Printing the results
        if let street1 = street1 {
            print("Street for John: \(street1)")
        } else {
            print("John has no address or street.")
        }
        
        // Example 6 -- Accessing Subscripts of Optional Type
        var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
        print("testScores", testScores)

        // Example 7 -- Linking Multiple Levels of Chaining Calling
        let address6 = AddressSubscripts(streets: ["123 Main St", "456 Side St"])
        let person6 = PersonSubscripts(name: "John", addresses: [address6])
        let family = Family(members: [person6])
        
        // Linking multiple levels of optional chaining
        let street6 = family.members?[0].addresses?[0].streets[0]
        if let street6 = street6 {
            print("Street for John: \(street1)")
        } else {
            print("John has no address or street.")
        }
        
        // Example 8 -- Chaining on Methods with Optional Return Values Calling
        
        let person: PersonChaining? = PersonChaining(name: "John", address: AddressChaining(street: "123 Main St", city: "Cityville"))

        // Optional chaining to access properties on optional values
        let city = person?.address?.city

        // Optional chaining with a method that returns an optional value
        let uppercaseName = person?.name.uppercased()

        print(city)          // Output: Optional("Cityville")
        print(uppercaseName) // Output: Optional("JOHN")

    }
}

//MARK: Optional Chaining as an Alternative to Forced Unwrapping
class PersonOptional {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

//MARK: Defining Model Classes for Optional Chaining
class PersonOptionalChaining {
    var name: String
    var address: Address?
    
    init(name: String, address: Address? = nil) {
        self.name = name
        self.address = address
    }
}

class Address {
    var city : String?
    var postalCode: String?
    
    init(city: String, postalCode: String? = nil) {
        self.city = city
        self.postalCode = postalCode
    }
    
    // Methods Through Optional Chaining
    func fullAddress() -> String {
        return "\(String(describing: city)), \(String(describing: postalCode))"
    }
}

//MARK: Accessing Properties Through Optional Chaining
// Example above mention

//MARK: Methods Through Optional Chaining
//Above example

//MARK: Accessing Subscripts Through Optional Chaining
class AddressSubscripts {
    var streets: [String]

    init(streets: [String]) {
        self.streets = streets
    }

    // Subscript to access streets by index
    subscript(index: Int) -> String? {
        guard index >= 0, index < streets.count else {
            return nil
        }
        return streets[index]
    }
}

class PersonSubscripts {
    var name: String
    var addresses: [AddressSubscripts]?

    init(name: String, addresses: [AddressSubscripts]? = nil) {
        self.name = name
        self.addresses = addresses
    }
}

//MARK: Linking Multiple Levels of Chaining
class Family {
    var members: [PersonSubscripts]?
    
    init(members: [PersonSubscripts]? = nil) {
        self.members = members
    }
}

//MARK: Chaining on Methods with Optional Return Values
struct PersonChaining {
    var name: String
    var address: AddressChaining?
}

struct AddressChaining {
    var street: String
    var city: String
}

