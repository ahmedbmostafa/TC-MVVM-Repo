//
//  ViewController.swift
//  TCMVVM
//
//  Created by Ahmed on 15/06/2023.
//

import UIKit

class RepoVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var reachabilityController:ReachabilityController!
    var viewModel: RepoViewModel!
    let refreshControl = UIRefreshControl()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        checkReachability()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        bindViewModelOutput()
        viewModel.didLoad()
    }
    
    func checkReachability() {
        // the best experience is with real device
        reachabilityController = ReachabilityController(viewController: self)
        reachabilityController.handleConnectivityToInternet()
    }
    
    func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(identifier: "RepoTableViewCell")
        refreshControl.addTarget(self, action: #selector(refreshTableData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            guard let self = self else {return}
            switch output {
            case .reloadRepos:
                self.tableView.reloadData()
            case .showActivityIndicator(let show):
                show ? self.startAnimating() : self.stopAnimating()
            case .showError(let error):
                UIAlertController.showAlert(withMessage: error)
            }
        }
    }
    
    @objc func refreshTableData() {
        viewModel.output = { [weak self] output in
            guard let self = self else {return}
            switch output {
            case .reloadRepos:
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            default:
                break
            }
        }
        viewModel.didLoad()
    }
}

