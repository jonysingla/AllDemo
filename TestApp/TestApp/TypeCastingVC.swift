//
//  TypeCastingVC.swift
//  TestApp
//
//  Created by Jony on 18/01/24.
//

import UIKit

class TypeCastingVC: UIViewController {
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        //Example 1 : class Hierarchy for Type Casting
        let library = [
            Movie(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movie(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        
//        let library = [
//            Movie(name: "Casablanca", director: "Michael Curtiz"),
//            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
//            Movie(name: "Citizen Kane", director: "Orson Welles"),
//            Song(name: "The One And Only", artist: "Chesney Hawkes"),
//            Song(name: "Never Gonna Give You Up", artist: "Rick Astley"),
//            Series(name: "Test", artist: "Don't know")
//        ] as [Any]
        
        //Example 2 : Checking Type
        var movieCount = 0
        var songCount = 0
        
        for item in library {
            if item is Movie {
                movieCount += 1
            } else if item is Song {
                songCount += 1
            }
        }
        print("Media library contains \(movieCount) movies and \(songCount) songs")
        
        //Example 3: Downasting with as?
        for item in library {
            if let movie = item as? Movie {
                print("Movie: \(movie.name), dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: \(song.name), by \(song.artist)")
            } else {
                print("No value")
            }
        }
        
        //Example 4: Upcasting
        // Creating an instance of the subclass (Dog)
        let myDog = DogUpcasting()

        // Upcasting to the superclass type (Animal)
        let myAnimal: AnimalUpcasting = myDog

        // Accessing the method from the superclass
        myAnimal.makeSound()  // Output: Dog barks

        // Upcasting doesn't allow access to subclass-specific methods
        // Uncommenting the following line would result in a compilation error
        // myAnimal.fetch()
        
        //Example 5: Any
        var things: [Any] = []

        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        things.append({ (name: String) -> String in "Hello, \(name)" })
        
        //Example: 5.1 Any
        var anyValue: Any = 42
        anyValue = "Hello, World!"
        anyValue = [1, 2, 3]
        print("anyValue", anyValue)
        
        // Example 5.2 AnyObject
        var anyObjectValue: AnyObject = TypeCastingVC()
        print("anyObjectValue", anyObjectValue)
        
    }
}
//MARK: 1 Define a class Hierarchy for Type Casting
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

class Series {
    var artist: String
    var name: String
    init(name: String, artist: String) {
        self.artist = artist
        self.name = name
//        super.init(name: name)
    }
}

//MARK: 2 Upcasting
class AnimalUpcasting {
    func makeSound() {
        print("Animal makes a sound")
    }
}

class DogUpcasting: AnimalUpcasting {
    override func makeSound() {
        print("Dog barks")
    }

    func fetch() {
        print("Dog fetches")
    }
}
