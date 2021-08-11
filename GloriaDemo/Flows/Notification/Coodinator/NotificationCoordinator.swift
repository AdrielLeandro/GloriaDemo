//
//  NotificationCoordinator.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import UIKit

class NotificationCoordinator: CoordinatorProtocol {
    private let parentViewController: UIViewController
    private var navigation: UINavigationController!

    init(viewController: UIViewController) {
        self.parentViewController = viewController
    }
    
    func start() {
        let viewController = NotificationViewController(viewModel: NotificationViewModel(coordinator: self,
                                                                                         notificationRepository: NotificationDataRepository(dataSource: LocalNotificationDataSource())))
        navigation = UINavigationController(rootViewController: viewController)
        navigation.modalPresentationStyle = .fullScreen
        parentViewController.present(navigation, animated: true, completion: nil)
    }
    
    func toNext() {
        ProfileCoordinator(navigation: navigation).start()
    }
    
    func close() {
        navigation.dismiss(animated: true, completion: nil)
    }
}
