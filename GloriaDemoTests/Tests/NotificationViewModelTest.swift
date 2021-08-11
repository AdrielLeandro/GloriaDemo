//
//  NotificationViewModelTest.swift
//  GloriaDemoTests
//
//  Created by Adriel Pinzas on 10/08/21.
//

import XCTest
@testable import GloriaDemo

class NotificationViewModelTest: XCTestCase {
    private let coordinator = NotificationCoordinatorMock()
    private let repository = LocalNotificationRepositoryMock()
    private var viewModel: NotificationViewModel!
    private let indexPath = IndexPath(row: 1, section: 0)
    override func setUp() {
        super.setUp()
        viewModel = NotificationViewModel(coordinator: coordinator, notificationRepository: repository)
        repository.getNotificationClosure = { completion in
            completion(.success([GLNotificationMock.data, GLNotificationMock.data]))
        }
    }
    
    func testNumberOfSectionIsDiferentNil() {
        viewModel.getNotifications()
        XCTAssertEqual(viewModel.getNumberOfRow(), 2)
    }
    
    
    func testDidSelectRowProcess() {
        viewModel.getNotifications()
        XCTAssertEqual(viewModel.getNotification(from: indexPath).status, false)
        XCTAssertEqual(coordinator.invokeNextPage, false)
        viewModel.didSelectRowAt(indexPath: indexPath)
        XCTAssertEqual(viewModel.getNotification(from: indexPath).status, true)
        XCTAssertEqual(coordinator.invokeNextPage, true)
    }
}
