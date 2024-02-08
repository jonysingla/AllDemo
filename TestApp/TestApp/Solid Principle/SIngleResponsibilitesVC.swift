//
//  SIngleResponsibilitesVC.swift
//  TestApp
//
//  Created by Jony on 08/02/24.
//

import UIKit

//MARK: Before Single Responsibility
class SIngleResponsibilitesVC: UIViewController {
    
    var empName: String = ""
    var empID: Int = 0
    var empSalart : NSNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func empSalary() {
        
    }
    
    func empAttendance() {
        
    }
    
}

//MARK: After Single Responsibility
class Employee {
    var empName: String
    var empID: Int
    var empSalary : Double
    
    init(empName: String, empID: Int, empSalary: Double) {
        self.empName = empName
        self.empID = empID
        self.empSalary = empSalary
    }
}

class EmpSalary {
    func empSalary(employeeSalary: Double) -> Double {
//        var empSalary : employeeSalary
//        var empSalary = empSalary(employee: Employee(empName: "trest", empID: 10, empSalary: 10000))
        return employeeSalary
    }
}

class PaySlip {
    func paySlip() {
        
    }
}
