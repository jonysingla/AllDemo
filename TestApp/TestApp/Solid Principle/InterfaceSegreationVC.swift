//
//  InterfaceSegreationVC.swift
//  TestApp
//
//  Created by Jony on 08/02/24.
//

import UIKit

class InterfaceSegreationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

//MARK: Before Interface Segregation Principle
protocol Printer {
    func printDocument()
    func scanDocument()
    func faxDocument()
    func copyDocument()
}

class OfficePrinter: Printer {
    func printDocument() {
        // Implementation
    }
    
    func scanDocument() {
        // Implementation
    }
    
    func faxDocument() {
        // Implementation
    }
    
    func copyDocument() {
        // Implementation
    }
}

class HomePrinter: Printer {
    func printDocument() {
        // Implementation
    }
    
    func scanDocument() {
        // Implementation
    }
    
    func faxDocument() {
        // Implementation
    }
    
    func copyDocument() {
        // Implementation
    }
}

//MARK: After Interface Segregation Principle
protocol PrintableInterface {
    func printDocument()
}

protocol Scanable {
    func scanDocument()
}

protocol Faxable {
    func faxDocument()
}

protocol Copyable {
    func copyDocument()
}

class OfficePrinterISP: PrintableInterface, Scanable, Faxable, Copyable {
    func printDocument() {
        // Implementation
    }
    
    func scanDocument() {
        // Implementation
    }
    
    func faxDocument() {
        // Implementation
    }
    
    func copyDocument() {
        // Implementation
    }
}

class HomePrinterISP: PrintableInterface, Scanable {
    func printDocument() {
        // Implementation
    }
    
    func scanDocument() {
        // Implementation
    }
}

