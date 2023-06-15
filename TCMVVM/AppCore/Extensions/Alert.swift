//
//  Alert.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit

extension UIAlertController {

    @discardableResult
    static func showAlert(withMessage  message: String) -> UIAlertController{
        let controller = UIAlertController(title: nil,
                                           message: message,
                                           preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(controller, animated: true, completion: nil)
        return controller
    }
}
