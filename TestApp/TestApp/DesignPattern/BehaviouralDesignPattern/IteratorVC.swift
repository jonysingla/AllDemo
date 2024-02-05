//
//  IteratorVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
//

import UIKit

class IteratorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: 1 Iteration
        let numberArray = [1,2,3,4]
        for number in numberArray {
            print("number",number)
        }
        
        //MARK: 2 Iteration with IteratorProtocol and Sequence
        let greatItems = Items(items: [Item(name: "The Mist")] )
        for item in greatItems {
            print("I've read: \(item)")
        }
    }
}

struct Item {
    let name: String
}

struct Items {
    let items: [Item]
}

//Using Iterator Protocol
struct ItemsIterator: IteratorProtocol {

    private var current = 0
    private let items: [Item]

    init(items: [Item]) {
        self.items = items
    }

    mutating func next() -> Item? {
        defer { current += 1 }
        return items.count > current ? items[current] : nil
    }
}

extension Items: Sequence {
    func makeIterator() -> ItemsIterator {
        return ItemsIterator(items: items)
    }
}
