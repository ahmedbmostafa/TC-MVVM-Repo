//
//  MBProgressHUD.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showNoInternetMessage(_ message:String) -> MBProgressHUD{
        let progressHUD = MBProgressHUD.showAdded(to: self.view, animated: true)
        progressHUD.contentMode = .center
        progressHUD.label.text = message
        progressHUD.label.numberOfLines = 0
        progressHUD.mode = .text
        progressHUD.offset.y = -150
        progressHUD.isUserInteractionEnabled = false
        progressHUD.contentColor = .red
        return progressHUD
        
     }
    func hideInternetError(hud:MBProgressHUD? ){
        hud?.hide(animated: true)
    }

}
