//
//  CodeableVC.swift
//  TestApp
//
//  Created by Jony on 06/02/24.
//

import UIKit

class CodeableVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let person = PersonCodeable(firstName: "John", lastName: "Doe", age: 30)
        
        // Encoding to JSON
        let encoder = JSONEncoder()
        var jsondata = Data()
        
        do {
             jsondata = try encoder.encode(person)
        } catch  {
            print("Encoding failed: \(error)")
        }
        
        let decoder = JSONDecoder()
        do {
            let decodedPerson = try decoder.decode(PersonCodeable.self, from: jsondata)
            print(decodedPerson)
        } catch {
            print("Decoding failed: \(error)")
        }
        
/*     //With JSON
        let person = PersonCodeable(firstName: "John", lastName: "Doe", age: 30)

        // Encoding to JSON
        let encoder = JSONEncoder()
        
        do {
            let jsondata = try encoder.encode(person)
        } catch  {
            print("Encoding failed: \(error)")
        }

        // Decoding from JSON
        let jsonString = """
        {
            "firstName": "Jane",
            "lastName": "Doe",
            "age": 25
        }
        """
        
        let decoder = JSONDecoder()
        do {
            let decodedPerson = try decoder.decode(PersonCodeable.self, from: jsonString.data(using: .utf8)!)
            print(decodedPerson)
        } catch {
            print("Decoding failed: \(error)")
        }

        // Output: Person(firstName: "John", lastName: "Doe", age: 30)
 */
    }
}
//MARK: Codeable protocol
struct PersonCodeable: Codable {
  let firstName: String
  let lastName: String
  let age: Int
}
