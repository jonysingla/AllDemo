//
//  MemorySafetyVC.swift
//  TestApp
//
//  Created by Jony on 29/01/24.
//

import UIKit

class MemorySafetyVC: UIViewController {
    var stepSize = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: 1 Conflicting Access to In-Out Parameters
        //        increment(&stepSize)              //Error -- run time crash
        print("Before stepSize",stepSize)
        var copyOfStepSize = stepSize
        print("Before copyOfStepSize",copyOfStepSize)
        
        increment(&copyOfStepSize)
        print("After copyOfStepSize",copyOfStepSize)
        stepSize = copyOfStepSize
        print("After stepSize",stepSize)
        
        
        //MARK: Example: 2 Conflicting Access to self in Methods
//        var player = Player(name: "Test", health: 10, energy: 8)
//        player.restoreHealth()
        var oscar = Player(name: "Oscar", health: 10, energy: 10)
        var maria = Player(name: "Maria", health: 5, energy: 10)
        oscar.shareHealth(with: &maria)
//        oscar.shareHealth(with: &oscar)                 // Error - Inout arguments are not allowed to alias each other
        
        //MARK: Example: 3 Conflicting Access to Properties
        var playerInformation = (health: 10, energy: 20)
        oscar.balance(&playerInformation.health, &playerInformation.energy) // Working fine on our end no error
        
        var holly = Player(name: "Holly", health: 10, energy: 10)
        oscar.balance(&holly.health, &holly.energy)                         // Working fine on our end no error
                
    }
    func increment(_ number: inout Int) {
        number += stepSize
    }
}

//MARK: 2 Conflicting Access to self in Methods
struct Player {
    var name: String
    var health: Int
    var energy: Int

    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
    
    func balance(_ x: inout Int, _ y: inout Int) {
        let sum = x + y
        x = sum / 2
        y = sum - x
    }
    
    
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}

