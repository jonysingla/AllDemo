//
//  OpaqueTypeVC.swift
//  TestApp
//
//  Created by Jony on 17/01/24.
//

import UIKit

class OpaqueTypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Example 1: Opaque Type
        func getAnimal() -> some Animal {
            return Dog()
        }
        
        //MARK: 2 Opaque type with Generic
        var objDog : Dog = Dog()
        var objCat : Cat = Cat()
        
        let opaqueDog = animalVoice(objDog)
        let opaqueCat = animalVoice(objCat)
        
        print("Dog voice ",opaqueDog.makeSound())
        print("Cat voice ",opaqueCat.makeSound())
        
        //MARK: 3 Optional Box type
        let optionalValue: Int? = 42 // Boxed as Optional
        print("optionalValue",optionalValue ?? 0)
        
        //MARK: 3.1 Array Box type
        let numbers: [Int] = [1, 2, 3] // Elements are boxed in an Array
        print("numbers",numbers)
        
        //MARK: 3.2 Custom Box type
        let boxedValue: CustomBox<Int> = CustomBox(value: 42) // Custom Box type
        print("boxedValue",boxedValue.value)
        
        //Example: 3.3 Protocol Box type
        // Box instances of concrete types into AnyVehicle
        let boxedDog: AnyAnimal = AnyAnimal(objDog)
        let boxedCat: AnyAnimal = AnyAnimal(objCat)
        
        // Use the boxed instances without exposing the concrete types
        print("boxed Dog",boxedDog.makeSound())
        print("boxed Cat",boxedCat.makeSound())
        
    }
    //Example 2: Generic Function with Opaque
    func animalVoice<T: Animal>(_ voice: T) -> some Animal {
        return voice
    }
}

//MARK: 1 Opaque Type
protocol Animal {
    func makeSound() -> String
}

struct Dog: Animal {
    func makeSound() -> String {
        return "Woof"
    }
}

struct Cat: Animal {
    func makeSound() -> String {
        return "Meow"
    }
}
//Example 3.2 Custom Box
struct CustomBox<T> {
    let value: T
}

//MARK: 3.3 Protocol Box Type
struct AnyAnimal : Animal {
    private let makeNoise: () -> String
    
    init<T: Animal>(_ animal: T) {
        makeNoise = animal.makeSound
    }
    
    func makeSound() -> String {
        return makeNoise()
    }
}

