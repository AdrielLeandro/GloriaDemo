//
//  LocalNotificationRepositoryMock.swift
//  GloriaDemoTests
//
//  Created by Adriel Pinzas on 10/08/21.
//

import Foundation
@testable import GloriaDemo

class LocalNotificationRepositoryMock: NotificationRepository {
    var getNotificationClosure :((Result<[GLNotification], Error>) -> Void) -> Void = { _ in }
    
    
    func getNotification(completion: @escaping (Result<[GLNotification], Error>) -> Void) {
        getNotificationClosure(completion)
    }
}
