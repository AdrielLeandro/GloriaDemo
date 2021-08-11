//
//  ProfileDataSource.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 10/08/21.
//

import Foundation

protocol ProfileDataSource {
    func getProfile(completion: @escaping (Result<ProfileDTO, Error>) -> Void)
}

class LocalProfileDataSource: ProfileDataSource {
    func getProfile(completion: @escaping (Result<ProfileDTO, Error>) -> Void) {
        if let path = Bundle.main.path(forResource: "Profile", ofType: "json") {
            do {
                guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
                      let profile = try? JSONDecoder().decode(ProfileDTO.self, from: data) else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                    return
                }
                completion(.success(profile))
            }
        }
    }
}
