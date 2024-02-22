//
//  GenericModelCodable.swift
//  TestApp
//
//  Created by Jony on 21/02/24.
//

import UIKit

class GenericModelCodable: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Example 1
        do {
            let intModel = GenericModel(value: 10)
            let jsonData = try JSONEncoder().encode(intModel)
            let decodedIntModel = try JSONDecoder().decode(GenericModel<Int>.self, from: jsonData)

            print(decodedIntModel.value) // Output: 10

            let stringModel = GenericModel(value: "Hello, World!")
            let stringData = try JSONEncoder().encode(stringModel)
            let decodedStringModel = try JSONDecoder().decode(GenericModel<String>.self, from: stringData)

            print(decodedStringModel.value) // Output: Hello, World!
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
        // Example 2
        let jsonData = """
        {
           "data": {
               "name": "John",
               "age": 30
           }
        }
        """.data(using: .utf8)!
        
        do {
           let decoder = JSONDecoder()
//            let response = try decoder.decode(Response<User<<#T: Decodable & Encodable#>>>.self, from: jsonData)
//           print(response.data.name) // Output: John
//           print(response.data.age) // Output: 30
        } catch {
           print("Error decoding JSON: \(error)")
        }
        
        // Example 3
        let person = PersonTwo(name: "John", age: 30)
        let genericModel = GenericModelTwo(data: person)

        let jsonEncoder = JSONEncoder()
        if let jsonData = try? jsonEncoder.encode(genericModel),
           let jsonString = String(data: jsonData, encoding: .utf8) {
               print(jsonString) //         // Output: {"data":{"name":"John","age":30}}
        }
    }
}

//MARK: Example 1 Generic Model Codable
import Foundation

struct GenericModel<T: Codable>: Codable {
    let value: T
}

//MARK: Example 2 Generic Model Codable
struct Response<T: Codable>: Codable {
   let data: T
}

struct User<T: Codable>: Codable {
   let name: T
   let age: T
}

//MARK: Example 3 Generic Model Codable
// Define a generic struct that conforms to Codable protocol
struct GenericModelTwo<T: Codable>: Codable {
    let data: T
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(data: T) {
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(T.self, forKey: .data)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(data, forKey: .data)
    }
}

struct PersonTwo: Codable {
    let name: String
    let age: Int
}



