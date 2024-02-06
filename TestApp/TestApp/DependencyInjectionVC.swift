//
//  PropertyInjectionVC.swift
//  TestApp
//
//  Created by Jony on 06/02/24.
//

import UIKit

class DependencyInjectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Example 1 Without Dependency Injection
        var libraryViewModel = LibraryViewModel()
        libraryViewModel.library                        // Here library object is dependent to libraryViewModel, so avoid this we use dependency injection
        
        
        //Example 1.1 -- With Dependency Injection
        let libraryViewModelOne = LibraryViewModelOne()
        let library = Library()
        libraryViewModelOne.library = library           // Here both class has different object not to dependent to each other
    }

}
//MARK: 1. Property Base injection
//Without Dependency
class LibraryViewModel {
     var library = Library()            // Creating Dependcy
}

class Library {
}

//Creating Dependency Injection
class LibraryViewModelOne {
    var library : Library?         // Here we inject property object
}

//MARK: 2. Constructor Base Injection
class LibraryViewModelTwo {
    var library : Library
    init(library: Library) {
        self.library = library
    }
}

//MARK: 3 Method Injection
class LibraryViewModelThree {
    func recordBooks (in library : Library) {
        
    }
}

// also use protocol to create method base injection
protocol LibraryManager {
    func recordBook(in libarary: Library)
}
