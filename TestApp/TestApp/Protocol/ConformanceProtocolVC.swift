//
//  ConformanceProtocolVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
//

import UIKit

class ConformanceProtocolVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
//MARK: 1 Conformance Protocol with is
protocol PrintableConformanceProtocol {
    func printDescription()
}

struct BookConformanceProtocol: PrintableConformanceProtocol {
    func printDescription() {
        print("Book description")
    }
}

//MARK: 2 Conformance Protocol with as? and as!
protocol PlayableConformanceProtocol {
    func play()
}

class MusicianConformanceProtocol: PlayableConformanceProtocol {
    func play() {
        print("Playing music")
    }
}




