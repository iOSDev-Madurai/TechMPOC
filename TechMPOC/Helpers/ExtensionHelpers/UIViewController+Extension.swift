//
//  UIViewController+Extension.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit



extension UIViewController {


    // MARK:- Alert

    func showAlertWith(AlertTitle title: String = "", ActionTitle actionTitle: String = AlertConstants.ok, AlertId id: String = "", SecondAction actionTwo: UIAlertAction? = nil, andMessage message : String) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let singleAction = UIAlertAction(title: actionTitle, style: .default) { (action) in
            self.alertAction(withId: id)
        }
        alertController.addAction(singleAction)
        if let secondAction = actionTwo {

            alertController.addAction(secondAction)
        }
        self.present(alertController, animated: true, completion: nil)
    }

    @objc public func alertAction(withId alertId: String) {
        
    }

    func getAlertAction(byTitle title: String) -> UIAlertAction {

        let action = UIAlertAction(title: title, style: .default) { (action) in
            debugPrint("alert action with no action")
        }
        return action
    }

}
