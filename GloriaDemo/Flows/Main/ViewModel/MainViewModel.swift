//
//  MainViewModel.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 8/08/21.
//

import Foundation

class MainViewModel {
    private let coordinator: CoordinatorProtocol
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func didTouchNotificationButton() {
        coordinator.toNext()
    }
}
