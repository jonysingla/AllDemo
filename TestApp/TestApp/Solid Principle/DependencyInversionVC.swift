//
//  DependencyInversionVC.swift
//  TestApp
//
//  Created by Jony on 08/02/24.
//

import UIKit

class DependencyInversionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

// MARK: Before Dependency Inversion Principle:
//class PaymentProcessor {
//    private let paymentGateway: PaymentGateway
//
//    init() {
//        paymentGateway = PaymentGateway()
//    }
//
//    func processPayment(amount: Double) {
//        // Process the payment using the payment gateway
//        paymentGateway.processPayment(amount: amount)
//    }
//}
//
//class PaymentGateway {
//    func processPayment(amount: Double) {
//        // Actual implementation of processing the payment
//        print("Payment Succesfull 100")
//    }
//}

// MARK: After Dependency Inversion Principle:
protocol PaymentGateway {
    func processPayment(amount: Double)
}


class SwipePayment : PaymentGateway {
    func processPayment(amount: Double) {
        print("Swipe Payment \(amount)")
    }
    
}
class PaypalPayment : PaymentGateway {
    func processPayment(amount: Double) {
        print("Paypal Payment \(amount)")
    }
}


class ProcessPayment {
    private let paymentGateway: PaymentGateway
    
    init(paymentGateway: PaymentGateway) {
        self.paymentGateway = paymentGateway
    }
    func processPayment(amount: Double) {
        paymentGateway.processPayment(amount: amount)
    }
}
