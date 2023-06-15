//
//  MockRepoDataProvider.swift
//  TCMVVMTests
//
//  Created by Ahmed on 15/06/2023.
//

import XCTest
@testable import TCMVVM

class MockRepoDataProvider: RepoDataProviderProtocol {
    
    func fetchRepos(completion: @escaping ([RepoResponseModel]?, String?) -> Void) {
        let repos = try! JSONDecoder().decode([RepoResponseModel].self, from: repoStub)
        completion(repos, nil)
    }
    
}
