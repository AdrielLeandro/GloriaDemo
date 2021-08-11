//
//  ProfileViewModel.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 9/08/21.
//

import Foundation

class ProfileViewModel {
    private let coordinator: CoordinatorProtocol
    private let repository: ProfileRepository
    var didSuccess: ((Profile) -> Void)?
    
    init(coordinator: CoordinatorProtocol, repository: ProfileRepository) {
        self.coordinator = coordinator
        self.repository = repository
    }
    
    func getProfile() {
        repository.getProfile { [weak self] result in
            switch result {
            case .success(let profile):
                self?.didSuccess?(profile)
            case .failure:
                break
            }
        }
    }
    
    func didTouchBack() {
        coordinator.close()
    }
}
