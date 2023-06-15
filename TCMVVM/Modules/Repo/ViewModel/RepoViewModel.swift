//
//  RepoViewModel.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import Foundation

typealias RepoViewModelOutput = (RepoViewModel.Output) -> ()

protocol RepoViewModelProtocol {
    var dataProvider: RepoDataProviderProtocol! {get}
    var output: RepoViewModelOutput? { get set }
    var numberOfRepos: Int { get }
    func getReposCellViewModel(index : Int) -> RepoCellViewModel
    func didLoad()
}

class RepoViewModel: RepoViewModelProtocol{
    
    enum Output {
        case reloadRepos
        case showActivityIndicator(show: Bool)
        case showError(error: String)
    }
    
    var dataProvider: RepoDataProviderProtocol!
    
    init(withDataProvider dataProvider: RepoDataProviderProtocol) {
        self.dataProvider = dataProvider
    }
    
    var output: RepoViewModelOutput?
    
     var allReposViewModels = [RepoCellViewModel]() {
        didSet {
            output?(.reloadRepos)
        }
    }
    
    private var reposDataSourceViewModels: [RepoCellViewModel] {
        return allReposViewModels
    }
    
    var numberOfRepos: Int {
        return reposDataSourceViewModels.count
    }
    
    func getReposCellViewModel(index: Int) -> RepoCellViewModel {
        return reposDataSourceViewModels[index]
    }
    
    func didLoad() {
        getRepos()
    }
    
    private func getRepos() {
        output?(.showActivityIndicator(show: true))
        dataProvider.fetchRepos(completion: { repos, error in
            self.output?(.showActivityIndicator(show: false))
            guard error == nil else {
                self.output?(.showError(error: error ?? "Error"))
                return
            }
            guard let repos = repos else {
                self.output?(.showError(error: error ?? "Error"))
                return
            }
            self.allReposViewModels = repos.map{RepoCellViewModel($0)}
        })
    }
    
}
