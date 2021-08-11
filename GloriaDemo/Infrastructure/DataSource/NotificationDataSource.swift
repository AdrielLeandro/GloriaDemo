//
//  NotificationDataSource.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import Foundation

protocol NotificationDataSource {
    func getNotfication(completion: @escaping (Result<[NotificationDTO], Error>) -> Void)
}

class LocalNotificationDataSource: NotificationDataSource {
    func getNotfication(completion: @escaping (Result<[NotificationDTO], Error>) -> Void) {
        if let path = Bundle.main.path(forResource: "Notifications", ofType: "json") {
            do {
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
                      let results = try? JSONDecoder().decode([NotificationDTO].self, from: data) else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                completion(.success(results))
            }
        }
    }
}
