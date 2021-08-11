//
//  NotificationViewModel.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import Foundation

class NotificationViewModel {
    private let coordinator: CoordinatorProtocol
    private let notificationRepository: NotificationRepository
    private var notifications: [GLNotification] = []
    private var cellViewModels: [NotificationCellViewModel] = []
    var didSuccess: (() -> Void)?
    
    init(coordinator: CoordinatorProtocol, notificationRepository: NotificationRepository) {
        self.coordinator = coordinator
        self.notificationRepository = notificationRepository
    }
    
    func getNotifications() {
        notificationRepository.getNotification { result in
            switch result {
            case .success(let notifications):
                self.notifications = notifications
                self.cellViewModels = notifications.map { NotificationCellViewModel(notification: $0)}
                self.didSuccess?()
            case .failure:
                break
            }
        }
    }
    
    @objc func didTouchClose() {
        coordinator.close()
    }
    
    func getNumberOfRow() -> Int {
        return notifications.count
    }
    
    func getViewModel(from indexPath: IndexPath) -> NotificationCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    func updateNotificationStatus(from indexPath: IndexPath) {
        notifications[indexPath.row].updateStatus()
    }
    
    func getNotification(from indexPath: IndexPath) -> GLNotification {
        return notifications[indexPath.row]
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        let notification = notifications[indexPath.row]
        updateNotificationStatus(from: indexPath)
        switch notification.notificationType {
        case .profile:
            coordinator.toNext()
        default:
            break
        }
    }
}
