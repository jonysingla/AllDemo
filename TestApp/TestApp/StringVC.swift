//
//  StringVC.swift
//  TestApp
//
//  Created by Jony on 04/12/23.
//

import UIKit

class StringVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Example 1 -- Empty string
        var testString = ""
        
        //Example 2 -- String Literals
        let someString = "Some string literal value"
        
        //Example 3 -- Multiline String Literals
        let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
        
        //Example 4 -- Extended String Delimeters
        let threeMoreDoubleQuotationMarks = #"""
        Here are three more double quotes: """
        """#
        
        //Example 4.1 --
        let singleLineString = "These are the same."
        let multilineString = """
        These are the same.
        """
//        print(singleLineString)
//        print(multilineString)

        //Example 4.2 --
        let softWrappedQuotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin, \
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on \
        till you come to the end; then stop."
        """
//        print(softWrappedQuotation)
        
        //Example 4.3 --
        let lineBreaks = """

        This string starts with a line break.
        It also ends with a line break.

        """
//        print(lineBreaks)
        //Example 4.3 --
        let threeMoreDoubleQuotationMarksTest = #"""
        Here are three more double quotes: """
        """#
//        print(threeMoreDoubleQuotationMarksTest)

        
//        let stringSwift4 = "This is "swift 4". " // Error
        let stringSwift40 = "This is \"swift 4\". "
//        print(stringSwift40)
        
        let stringSwift4 = """
        This is "swift 4"."
        """
//        print(stringSwift4)
        
        let stringSwif5 = #"This is "swift 4"." "#
//        print(stringSwif5)
        
        let greeting = "Guten Tag!"
        print(greeting[greeting.startIndex])
        // G
//        print(greeting[greeting.endIndex]) // Error

        
        print(greeting[greeting.index(before: greeting.endIndex)])
        // !
        print(greeting[greeting.index(after: greeting.startIndex)])
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        print(greeting[index])
        
        
        // Foundation Nsstring and String type cast using as keyword
        var objString : String = "Hello"
        var objNSString : NSString = ""
        
        objNSString = objString as NSString
        
//        var length = objString.leng
//        objString.uppercased()
        
        print("objNSString",objNSString)
        // https://developer.apple.com/documentation/swift/string#2919514
        
        //Bridge between String and NString
        
        var obj : Int? = nil
        var objOne : String = "nil"
        var objThree : NSString = "Hello"
        
//        objThree = "Hi"
//        var objFour : NSMutableString = ""
//        objFour = "test"
        
        objOne = objThree as String // Type Casting when we pass NSString to String
        
    }

}
