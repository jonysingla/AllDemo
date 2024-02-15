//
//  DelegateVsNotificationVC.swift
//  TestApp
//
//  Created by Jony on 08/02/24.
//

import UIKit

class DelegateVsNotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

//MARK: Delegate
protocol LoginManagerDelegate{
    func onLogin(result:AnyObject)
}

class LoginManager {
    struct Wrapper {
        static var delegate:LoginManagerDelegate?
    }

    class func userDidLogin(result : AnyObject){
         Wrapper.delegate?.onLogin(result: result)
    }
}

//MARK: Notification
class LoginManagerNotification {
    class func userDidLogin(result: AnyObject){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "onLogin"), object: result)
    }
}

/*
 Swift protocol with delgate move data one screen to another screen
 */
// MARK: - CodeAI Output
// protocol DataDelegate {
//    func sendData(data: Any)
//}
//
//class FirstViewController: UIViewController {
//    
//    var delegate: DataDelegate?
//    
//    func sendDataToSecondScreen() {
//        let data = "Hello, World!"
//        delegate?.sendData(data: data)
//    }
//}
//
//class SecondViewController: UIViewController, DataDelegate {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let firstVC = FirstViewController()
//        firstVC.delegate = self
//        firstVC.sendDataToSecondScreen()
//    }
//    
//    func sendData(data: Any) {
//        if let message = data as? String {
//            print("Received data from first screen: \(message)")
//        }
//    }
//}


/*
 Swift protocol with delgate move data one screen to multiple screen
 */

// MARK: - CodeAI Output
// protocol DataDelegate {
//    func sendDataToScreen1(data: Any)
//    func sendDataToScreen2(data: Any)
//    func sendDataToScreen3(data: Any)
//}
//
//class DataManager {
//    var delegate: DataDelegate?
//    
//    func sendDataToScreens(data: Any) {
//        delegate?.sendDataToScreen1(data: data)
//        delegate?.sendDataToScreen2(data: data)
//        delegate?.sendDataToScreen3(data: data)
//    }
//}
//
//class Screen1: DataDelegate {
//    init() {
//        let dataManager = DataManager()
//        dataManager.delegate = self
//        dataManager.sendDataToScreens(data: "Hello from Screen 1")
//    }
//    
//    func sendDataToScreen1(data: Any) {
//        print("Received data on Screen 1: \(data)")
//    }
//    
//    func sendDataToScreen2(data: Any) {
//        // Do nothing
//    }
//    
//    func sendDataToScreen3(data: Any) {
//        // Do nothing
//    }
//}
//
//class Screen2: DataDelegate {
//    
//    init() {
//        let dataManager = DataManager()
//        dataManager.delegate = self
//        dataManager.sendDataToScreens(data: "Hello from Screen 2")
//    }
//    
//    func sendDataToScreen1(data: Any) {
//        // Do nothing
//    }
//    
//    func sendDataToScreen2(data: Any) {
//        print("Received data on Screen 2: \(data)")
//        
//    }
//    
//     func sendDataToScreen3(data: Any) {
//         // Do nothing
//     }
//
//}
//
//class Screen3 : DataDelegate{
//   
//   init() {
//       let dataManager = DataManager()
//       dataManager.delegate = self
//       dataManager.sendDataToScreens(data:"Hello from screen 3")
//   }
//
//   func sendDataToScreen1 (data:Any){
//       //Do nothing
//   }
//
//   func sendDataToscreen2 (data:Any){
//       //Do nothing
//   }
//
//   func sendDatatoScren3 (data:Any){
//       print("Received Data on screen 3:\(data)")
//   }
//
//}
