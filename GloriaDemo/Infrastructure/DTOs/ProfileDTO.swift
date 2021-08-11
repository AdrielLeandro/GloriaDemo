//
//  ProfileDTO.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 10/08/21.
//

import Foundation

struct ProfileDTO {
    let id: String
    let name: String
    let photo: String?
    let numberVideos: Int
    let numberFollowers: Int
    let numberFollowings: Int
    
    
    func toProfile() -> Profile {
        return Profile(id: id, name: name, photo: photo, numberVideos: numberVideos, numberFollowers: numberFollowers, numberFollowings: numberFollowings)
    }
}

extension ProfileDTO: Decodable {
    enum Key: String, CodingKey {
        case id
        case name
        case photo
        case numberVideos
        case numberFollowers
        case numberFollowings
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.photo = try? container.decode(String.self, forKey: .photo)
        self.numberVideos = try container.decode(Int.self, forKey: .numberVideos)
        self.numberFollowers = try container.decode(Int.self, forKey: .numberFollowers)
        self.numberFollowings = try container.decode(Int.self, forKey: .numberFollowings)

    }
}
