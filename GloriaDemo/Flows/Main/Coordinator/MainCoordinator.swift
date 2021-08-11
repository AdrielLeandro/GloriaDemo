//
//  MainCoordinator.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    var viewController: UIViewController!
    
    func start() {
        let vc = MainViewController(viewModel: MainViewModel(coordinator: self))
        viewController = vc
    }
    
    func toNext() {
        NotificationCoordinator(viewController: viewController).start()
    }
    
    func close() { }
}
