//
//  RepoVC+EX.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit

extension RepoVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRepos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as? RepoTableViewCell else {return UITableViewCell()}
        
        let vm = viewModel.getReposCellViewModel(index: indexPath.row)
        cell.vm = vm
        
        return cell
    }
    
}
