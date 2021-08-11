//
//  NotificationCellViewModel.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import Foundation

class NotificationCellViewModel {
    let notification: GLNotification
    
    var didShowNotification: ((Bool) -> Void)?
    
    init(notification: GLNotification) {
        self.notification = notification
    }
    
    
}
