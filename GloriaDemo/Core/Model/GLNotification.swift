//
//  GLNotification.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import Foundation

class GLNotification {
    let id: String
    let text: String
    let highlightText: String
    let photo: String?
    var status: Bool
    let notificationType: NotificationType
    let profileId: String?
    
    init(id: String, text: String, highlightText: String, photo: String?, status: Bool, notificationType: NotificationType, profileId: String?) {
        self.id = id
        self.text = text
        self.highlightText = highlightText
        self.photo = photo
        self.status = status
        self.notificationType = notificationType
        self.profileId = profileId
    }
    
    enum NotificationType: String {
        case profile
        case message
    }
    
    func updateStatus() {
       status = true
    }
}

