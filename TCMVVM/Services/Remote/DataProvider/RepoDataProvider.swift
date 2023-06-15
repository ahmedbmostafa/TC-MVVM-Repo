//
//  RepoService.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import Foundation

protocol RepoDataProviderProtocol {
    func fetchRepos(completion: @escaping ([RepoResponseModel]?, String?) -> Void)
}

class RepoDataProviderImp: RepoDataProviderProtocol {
    
    func fetchRepos(completion: @escaping ([RepoResponseModel]?, String?) -> Void) {
        
        let url = EndPoint.getRepo.url
        Request.request(url: url, httpMethod: .get) { (data, response, error) in
            
            guard let data = data else {
                completion(nil,error?.localizedDescription ?? "Error")
                return
            }
            guard error == nil else {
                completion(nil,error?.localizedDescription ?? "Error")
                 return
            }
            
            let repoObj = Parsing.decode(type: [RepoResponseModel].self, data: data)
            
            guard let repo = repoObj   else {
                completion(nil, "Error")
                return
            }
            
            completion(repo, nil)
            
        }
    }
}
