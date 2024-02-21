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

        // Do any additional setup after loading the view.
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
           let response = try decoder.decode(Response<User>.self, from: jsonData)
           
           print(response.data.name) // Output: John
           print(response.data.age) // Output: 30
        } catch {
           print("Error decoding JSON: \(error)")
        }
    }
}

struct Response<T: Codable>: Codable {
   let data: T
}

struct User: Codable {
   let name: String
   let age: Int
}




