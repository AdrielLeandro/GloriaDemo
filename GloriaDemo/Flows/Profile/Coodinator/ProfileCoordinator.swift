//
//  ProfileCoordinator.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import UIKit

class ProfileCoordinator: CoordinatorProtocol {
    private let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    func start() {
        let viewController = ProfileViewController(viewModel: ProfileViewModel(coordinator: self, repository: ProfileDataRepository(dataSource: LocalProfileDataSource())))
        navigation.pushViewController(viewController, animated: true)
    }
        
    func toNext() {}

    func close() {
        navigation.popToRootViewController(animated: true)
    }
}
