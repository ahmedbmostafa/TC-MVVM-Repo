//
//  TableView+Register.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit

extension UITableView {
    func registerNib(identifier: String) {
         let tableNib = UINib(nibName: identifier, bundle: nil)
         self.register(tableNib, forCellReuseIdentifier: identifier )
     }
}
