//
//  CopyOnWriteVC.swift
//  TestApp
//
//  Created by Jony on 27/02/24.
//

import UIKit

class CopyOnWriteVC: UIViewController {
    
    override func viewDidLoad()  {
        super.viewDidLoad()

        //MARK: In class
        var reference1 = PersonClass(name: "John Appleseed")
        var reference2 = reference1
        
        print("class reference1",reference1.name as Any)
        print(UnsafeMutableRawPointer(bitPattern: ObjectIdentifier(reference1).hashValue) as Any)
        print("-----")
        print("class reference2",reference2.name as Any)
        print(UnsafeMutableRawPointer(bitPattern: ObjectIdentifier(reference2).hashValue) as Any)
        print("-----------------------------")
        
        reference2.name = "Sumit"
        
        print("class reference1",reference1.name)
        print(UnsafeMutableRawPointer(bitPattern: ObjectIdentifier(reference1).hashValue) as Any)
        print("-----")
        print("class reference2",reference2.name)
        print(UnsafeMutableRawPointer(bitPattern: ObjectIdentifier(reference1).hashValue) as Any)
        print("-----------------------------")
        
        //MARK: Struct -- Copy on write
        var refer1 = PersonStruct(name: "Sandeep")
        var refer2 = refer1
        
        print("Struct refer1",refer1.name)
        withUnsafePointer(to: refer1) { pointer in
            print("Memory address of refer1: \(pointer)")
        }
        print("-----")
        
        print("Struct refer2",refer2.name)
        withUnsafePointer(to: refer2) { pointer in
            print("Memory address of refer2: \(pointer)")
        }
        print("-----------------------------")
        
        refer2.name = "iOS"
        
        print("Struct refer1",refer1.name)
        withUnsafePointer(to: refer1) { pointer in
            print("Memory address of refer1: \(pointer)")
        }
        print("-----")
        
        print("Struct refer2",refer2.name)
        withUnsafePointer(to: refer2) { pointer in
            print("Memory address of refer2: \(pointer)")
        }
        
        //MARK: Array -- Copy on write
        var array1: [Int] = [0, 1, 2, 3]
        var array2 = array1

        printAddress(address: array1) //0x7b100005e720
        printAddress(address: array2) //0x7b100005e720
        print("-----------------------------")
        
        //Let's mutate array2 to see what's
        array2.append(4)

        printAddress(address: array1) //0x7b100005e720
        printAddress(address: array2) //0x7b18000522e0
        
        //MARK: Copy on write with Generic and checking unique value isKnownUniquelyReferenced
        let value = 0

        var box1 = BoxCopyOnWrite(value: value)
        var box2 = box1

        //same addresses
        print(printAddress(&box1.ref.value)) //0x600000ac2490
        print(printAddress(&box2.ref.value)) //0x600000ac2490

        box2.value = 1

        print(box1.value) //0
        print(box2.value) //1

        //COW in action
        //different addresses
        print(printAddress(&box1.ref.value)) //0x600000ac2490
        print(printAddress(&box2.ref.value)) //0x600000a9dd30

    }
    func printAddress(address o: UnsafeRawPointer ) {
        print(String(format: "%p", Int(bitPattern: o)))
    }
    
    
    // Print memory address
    func printAddress(_ object: UnsafeRawPointer) -> String {
        let address = Int(bitPattern: object)
        return NSString(format: "%p", address) as String
    }
}

class PersonClass {
    var name : String
    init(name: String) {
        self.name = name
    }
}

struct PersonStruct {
    var name : String
//    init(name: String) {
//        self.name = name
//    }
}



struct BoxCopyOnWrite<T> {
    fileprivate var ref: Ref<T>
    
    init(value: T) {
        self.ref = Ref(value: value)
    }

    var value: T {
        get {
            return ref.value
        }

        set {
            //it is true when there is only one(single) reference to this object
            //that is why it is safe to update,
            //if not - new reference to heap is created with a copy of value
            if (isKnownUniquelyReferenced(&self.ref)) {
                self.ref.value = newValue
            } else {
                self.ref = Ref(value: newValue)
            }
        }
    }
    
    final class Ref<T> {
        var value: T
        init(value: T) {
            self.value = value
        }
    }
}
