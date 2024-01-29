//
//  ARCClosureVC.swift
//  TestApp
//
//  Created by Jony on 29/01/24.
//

import UIKit

class ARCClosureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Example 1 : Problem with Closure / Example 2:  Resolve with capture list
        let heading = HTMLElement(name: "h1")
        let defaultText = "some default text"
        heading.asHTML = {
            return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
        }
        print(heading.asHTML())
        
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        // Prints "<p>hello, world</p>"
        paragraph = nil
        
        //Example 3: Capture list with weak
        
    }
}

//MARK: 1 Problem with Closure -- as strong reference -- Strong Reference Cycles for Closures
class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

//MARK: 2 Resolve strong reference cycle with closure
//class HTMLElement {
//
//    let name: String
//    let text: String?
//
//    lazy var asHTML: () -> String = { [unowned self] in
//        if let text = self.text {
//            return "<\(self.name)>\(text)</\(self.name)>"
//        } else {
//            return "<\(self.name) />"
//        }
//    }
//
//    init(name: String, text: String? = nil) {
//        self.name = name
//        self.text = text
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}

//MARK: 3 Capture list with weak
class SomeClassWeak {
    var closure: (() -> Void)?

    func setupClosure() {
        closure = { [weak self] in
            self?.someMethod()
        }
    }

    func someMethod() {
        print("Closure executed")
    }
}

//MARK: 4 Capture list with weak another example
class SomeClassWeakProperty {
    var closure: (() -> Void)?

    func setupClosure() {
        weak var weakSelf = self
        closure = {
            weakSelf?.someMethod()
        }
    }

    func someMethod() {
        print("Closure executed")
    }
}
//MARK: 5 Capture list with unowned another example
class SomeClassUnowned {
    var closure: (() -> Void)?

    func setupClosure() {
        unowned let unownedSelf = self
        closure = {
            unownedSelf.someMethod()
        }
    }

    func someMethod() {
        print("Closure executed")
    }
}
//MARK: 6 Using Capture List with Parameters:
class SomeClassParameters {
    var someProperty: Int = 10
    var closure: (() -> Void)?

    func setupClosure() {
        let localVar = 20
        closure = { [weak self, localVar] in
            guard let self = self else { return }
            print("someProperty: \(self.someProperty), localVar: \(localVar)")
        }
    }
}
