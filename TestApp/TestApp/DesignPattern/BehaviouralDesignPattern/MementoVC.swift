//
//  MementoVC.swift
//  TestApp
//
//  Created by Jony on 05/02/24.
//
/*
 Originator: This is the object whose state you want to capture. It provides methods to save and restore its state using memento objects.
 Memento: This is an object that encapsulates the state of the originator. It provides methods for getting and setting the state.
 Caretaker: This is an object that is responsible for storing and managing memento objects. It interacts with the originator to save and restore its state.
 
 The Originator is the object whose state we want to save and restore.
 The Memento encapsulates the state of the Originator.
 The Caretaker manages a list of mementos and interacts with the Originator to save and restore its state.
 */

import UIKit

class MementoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Usage
        let originator = Originator(state: "Initial state")
        let caretaker = Caretaker()

        // Save state
        caretaker.addMemento(memento: originator.saveToMemento())

        // Change state
        originator.setState(state: "New state")

        // Restore state
        if let memento = caretaker.getMemento(index: 0) {
            originator.restoreFromMemento(memento: memento)
//            print("Restored state: \(originator.getState())") // Output: Restored state: Initial state
        }
    }
}

// Memento
class Memento {
    private let state: String
    
    init(state: String) {
        self.state = state
    }
    
    func getState() -> String {
        return state
    }
}

// Originator
class Originator {
    private var state: String
    
    init(state: String) {
        self.state = state
    }
    
    func setState(state: String) {
        self.state = state
    }
    
    func saveToMemento() -> Memento {
        return Memento(state: state)
    }
    
    func restoreFromMemento(memento: Memento) {
        state = memento.getState()
    }
}

// Caretaker
class Caretaker {
    private var mementos: [Memento] = []
    
    func addMemento(memento: Memento) {
        mementos.append(memento)
    }
    
    func getMemento(index: Int) -> Memento? {
        guard index >= 0 && index < mementos.count else {
            return nil
        }
        return mementos[index]
    }
}

