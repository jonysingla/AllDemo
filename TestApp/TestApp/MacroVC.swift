//
//  MacroVC.swift
//  TestApp
//
//  Created by Jony on 09/01/24.
//

import UIKit

class MacroVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Example 1 -- Macro
        myFunction()
    }
    
    //MARK: Freestanding Macros
    func myFunction() {
        print("Currently running \(#function)")     // With Macro
        //        print("Currently running \(function)")    // Without Macro
        #warning("Something's wrong")
        
        
        //        public macro OptionSet<RawType>() = #externalMacro(module: "SwiftMacros", type: "OptionSetMacro")
    }
}

struct SundaeToppings {
    private enum Options: Int {
        case nuts
        case cherry
        case fudge
    }


    typealias RawValue = Int
    var rawValue: RawValue
    init() { self.rawValue = 0 }
    init(rawValue: RawValue) { self.rawValue = rawValue }
    static let nuts: Self = Self(rawValue: 1 << Options.nuts.rawValue)
    static let cherry: Self = Self(rawValue: 1 << Options.cherry.rawValue)
    static let fudge: Self = Self(rawValue: 1 << Options.fudge.rawValue)
}
extension SundaeToppings: OptionSet { }
