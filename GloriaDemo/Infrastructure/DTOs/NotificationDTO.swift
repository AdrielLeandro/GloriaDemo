//
//  NotificationDTO.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import Foundation

struct NotificationDTO {
    let id: String?
    let text: String?
    let highlightText: String?
    let photo: String?
    let status: Bool?
    let notificationType: String?
    let profileId: String?
    
    func toNotification() -> GLNotification? {
        guard let id = id, let text = text, let notificationType = notificationType else {
            return nil
        }
        return GLNotification(id: id,
                            text: text,
                            highlightText: highlightText ?? "",
                            photo: photo ?? nil,
                            status: status ?? false,
                            notificationType: GLNotification.NotificationType(rawValue: notificationType) ?? .message,
                            profileId: profileId)
    }
}

extension NotificationDTO: Decodable {
    enum Key: String, CodingKey {
        case id
        case text
        case highlightText
        case photo
        case status
        case notificationType
        case profileId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.id = try? container.decode(String.self, forKey: .id)
        self.text = try? container.decode(String.self, forKey: .text)
        self.highlightText = try? container.decode(String.self, forKey: .highlightText)
        self.photo = try? container.decode(String.self, forKey: .photo)
        self.status = try? container.decode(Bool.self, forKey: .status)
        self.notificationType = try? container.decode(String.self, forKey: .notificationType)
        self.profileId = try? container.decodeIfPresent(String.self, forKey: .profileId)
    }
}
