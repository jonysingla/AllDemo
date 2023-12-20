//
//  NilViewController.swift
//  TestApp
//
//  Created by Jony on 11/12/23.
//

import UIKit

class NilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        
    }
}

//MARK: nil
//1. nil only used for object?
// 2. Is Contain memory or not? Yes -- Memory is not deallocted like Zombie Object or Dangling Pointer

class One {
    var objOne : String = "hello"
    var objTwo : Int? = nil
    var objThree : Float? = nil
}

//MARK: Nil
//NSString *myString = Nil;

//MARK: NULL
//NSString *myString = NULL;
//int *myIntPtr = NULL;

//MARK: NSNULL
//NSArray *arrayWithNull = @[NSNull.null, @"value", @42];



