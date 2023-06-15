//
//  AppFlowManager.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit


class AppFlowManager {

    func start(navigationController: UINavigationController) {
        let vc = creatRepoVC()
        navigationController.pushViewController(vc, animated: false)
    }
}

extension AppFlowManager {
    
    func creatRepoVC() -> UIViewController {
        let repoVC = RepoVC.instantiate(fromAppStoryboard: .Main)
        let dataProvider = RepoDataProviderImp()
        let viewModel = RepoViewModel(withDataProvider: dataProvider)
        viewModel.dataProvider = dataProvider
        repoVC.viewModel = viewModel
        return repoVC
    }
}
