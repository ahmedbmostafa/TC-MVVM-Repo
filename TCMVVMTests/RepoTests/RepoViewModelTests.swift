//
//  RepoViewModelTests.swift
//  TCMVVMTests
//
//  Created by Ahmed on 15/06/2023.
//

import XCTest
@testable import TCMVVM

 class RepoViewModelTests: XCTestCase {

     var dataProvider: MockRepoDataProvider!
     var viewModel: RepoViewModel!
     var view = MockRepoVC()
     
     override func setUp() {
         super.setUp()
         dataProvider = MockRepoDataProvider()
         viewModel = RepoViewModel(withDataProvider: dataProvider)
         view.viewModel = viewModel
         view.bindViewModelOutput()
     }
     
     override func tearDown() {
         super.tearDown()
         dataProvider = nil
         viewModel = nil
     }
  
     func testNumberOfRepos() {
         let expectation = self.expectation(description: "fetching")
         dataProvider.fetchRepos { repos, _ in
             self.viewModel.allReposViewModels = repos!.map{RepoCellViewModel($0)}
             expectation.fulfill()
         }
         waitForExpectations(timeout: 5, handler: nil)
         viewModel.didLoad()
         XCTAssert(viewModel.numberOfRepos == 1)
     }
     
     func testGetRepoMethod() {
         let expectation = self.expectation(description: "fetching")
         dataProvider.fetchRepos { repos, _ in
             self.viewModel.allReposViewModels = repos!.map{RepoCellViewModel($0)}
             expectation.fulfill()
         }
         waitForExpectations(timeout: 5, handler: nil)
         viewModel.didLoad()
         let cellViewModel = viewModel.getReposCellViewModel(index: 0)
         XCTAssert(cellViewModel.name == "yajl-objc")
         XCTAssert(cellViewModel.description == "Objective-C bindings for YAJL (Yet Another JSON Library) C library")

     }

}
