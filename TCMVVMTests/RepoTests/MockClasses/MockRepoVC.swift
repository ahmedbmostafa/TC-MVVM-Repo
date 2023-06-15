//
//  MockRepoVC.swift
//  TCMVVMTests
//
//  Created by Ahmed on 15/06/2023.
//

import XCTest
@testable import TCMVVM

class MockRepoVC: RepoVC {
    
    var isShowLoaderCalls = false
    var isReloadCalls = false
    var isShowErrorCalls = false
    
    override func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            guard let self = self else { return }
            switch output {
            case .reloadRepos:
                self.isReloadCalls = true
            case .showActivityIndicator( _):
                self.isShowLoaderCalls = true
            case .showError( _):
                self.isShowErrorCalls = true
            }
        }
    }
    
}
