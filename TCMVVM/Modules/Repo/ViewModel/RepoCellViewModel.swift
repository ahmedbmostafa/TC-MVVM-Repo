//
//  RepoCellViewModel.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import Foundation

class RepoCellViewModel {
    
    var repo: RepoResponseModel!

    init(_ repo: RepoResponseModel!){
        self.repo = repo
    }
    
    var name: String {
        repo?.name ?? ""
    }
    var description: String {
        repo?.description ?? ""
    }
    
}
