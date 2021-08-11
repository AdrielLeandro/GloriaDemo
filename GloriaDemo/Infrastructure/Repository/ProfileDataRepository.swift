//
//  ProfileDataRepository.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 10/08/21.
//

import Foundation

protocol ProfileRepository {
    func getProfile(completion: @escaping (Result<Profile, Error>) -> Void)
}

class ProfileDataRepository: ProfileRepository {
    private let dataSource: ProfileDataSource
    
    init(dataSource: ProfileDataSource) {
        self.dataSource = dataSource
    }
    
    func getProfile(completion: @escaping (Result<Profile, Error>) -> Void) {
        dataSource.getProfile { result in
            switch result {
            case.success(let profileData):
                let profile = profileData.toProfile()
                completion(.success(profile))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
