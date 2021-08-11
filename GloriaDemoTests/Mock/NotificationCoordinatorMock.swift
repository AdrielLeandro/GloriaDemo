//
//  NotificationCoordinatorMock.swift
//  GloriaDemoTests
//
//  Created by Adriel Pinzas on 10/08/21.
//

import Foundation
@testable import GloriaDemo

class NotificationCoordinatorMock: CoordinatorProtocol {
    var invokeStart: Bool = false
    var invokeNextPage: Bool = false
    var invokeClose: Bool = false
    
    func start() {
        invokeStart = true
    }
    
    func toNext() {
        invokeNextPage = true
    }
    
    func close() {
        invokeClose = true
    }
}
