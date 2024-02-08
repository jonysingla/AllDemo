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
