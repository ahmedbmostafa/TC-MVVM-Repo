//
//  ReachabilityController.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit
import MBProgressHUD
class ReachabilityController{
    
    let reachability = Reachability()
    var hostHud:MBProgressHUD!
    var presentedHud:MBProgressHUD?
    weak var hostViewController:UIViewController?
    init (viewController:UIViewController){
        hostViewController = viewController
    }
    
    
    func handleConnectivityToInternet(){
        let msg = "No internet connection"
        reachability?.whenUnreachable = { [weak self]  _ in
            self?.hostHud = self?.hostViewController?.showNoInternetMessage(msg)
            self?.presentedHud =  self?.hostViewController?.presentedViewController?.showNoInternetMessage(msg)
        }
        
        reachability?.whenReachable = { [weak self] _ in
            self?.hostViewController?.hideInternetError(hud: self?.hostHud)
            self?.hostViewController?.presentedViewController?.hideInternetError(hud: self?.presentedHud)
        }
        startNotifier()
    }
    
    
    func startNotifier(){
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
    }
    func stopListner(){
        reachability?.stopNotifier()
    }
    
}
