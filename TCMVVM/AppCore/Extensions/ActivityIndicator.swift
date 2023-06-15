//
//  ActivityIndicator.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit
import NVActivityIndicatorView

var activityIndicator: NVActivityIndicatorView!

extension UIViewController {
    
    func startAnimating() {
        let xAxis = self.view.center.x
        let yAxis = self.view.center.y
        let frame = CGRect(x: (xAxis - 25), y: (yAxis - 25), width: 50, height: 50)
        activityIndicator = NVActivityIndicatorView(frame: frame)
        activityIndicator.color = #colorLiteral(red: 0, green: 0.4549019608, blue: 0.9254901961, alpha: 1)
        activityIndicator.type = .ballRotateChase
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
}
