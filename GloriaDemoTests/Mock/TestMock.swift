//
//  TestMock.swift
//  GloriaDemoTests
//
//  Created by Adriel Pinzas on 10/08/21.
//

import Foundation
@testable import GloriaDemo

struct GLNotificationMock {
    static let data = GLNotification(id: "1", text: "test", highlightText: "test test", photo: "photo", status: false, notificationType: .profile, profileId: "2")
}
