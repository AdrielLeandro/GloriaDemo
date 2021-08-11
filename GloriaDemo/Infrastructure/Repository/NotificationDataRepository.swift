//
//  NotificationDataRepository.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import Foundation

protocol NotificationRepository {
    func getNotification(completion: @escaping (Result<[GLNotification], Error>) -> Void)
}

class NotificationDataRepository: NotificationRepository {
    private let dataSource: NotificationDataSource
    
    init(dataSource: NotificationDataSource) {
        self.dataSource = dataSource
    }
    
    func getNotification(completion: @escaping (Result<[GLNotification], Error>) -> Void) {
        dataSource.getNotfication { result in
            switch result {
            case.success(let notification):
                let notifications = notification.compactMap { $0.toNotification() }
                completion(.success(notifications))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
