//
//  CommandVC.swift
//  TestApp
//
//  Created by Jony on 02/02/24.
// Ref: https://dev.to/sergeyleschev/swift-design-patterns-command-pattern-3044

import UIKit

class CommandVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let podBayDoors = "Doors"
        let doorModule = DoorsOperations(doors:podBayDoors)
        
        //Command will execute here with help of objects
        doorModule.open()
        doorModule.close()
    }
}


//MARK: Another Example
protocol DoorCommand {
    func execute() -> String
}

class OpenCommand: DoorCommand {
    let doors:String
    required init(doors: String) {
        self.doors = doors
    }
    func execute() -> String {
        print("Opened \(doors)")
        return "Opened \(doors)"
    }
}

class CloseCommand: DoorCommand {
    let doors:String

    required init(doors: String) {
        self.doors = doors
    }
    func execute() -> String {
        print("Closed \(doors)")
        return "Closed \(doors)"
    }
}
//MARK: Create class for Command
class DoorsOperations {
    let openCommand: DoorCommand
    let closeCommand: DoorCommand

    init(doors: String) {
        self.openCommand = OpenCommand(doors:doors)
        self.closeCommand = CloseCommand(doors:doors)
    }

    func close() -> String {
        return closeCommand.execute()
    }

    func open() -> String {
        return openCommand.execute()
    }
}
