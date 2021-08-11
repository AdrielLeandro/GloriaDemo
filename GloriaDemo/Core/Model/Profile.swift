//
//  Profile.swift
//  GloriaDemo
//
//  Created by Adriel Pinzas on 10/08/21.
//

import Foundation

class Profile {
    let id: String
    let name: String
    let photo: String?
    let numberVideos: Int
    let numberFollowers: Int
    let numberFollowings: Int
    
    init(id: String, name: String, photo: String?, numberVideos: Int, numberFollowers: Int, numberFollowings: Int) {
        self.id = id
        self.name = name
        self.photo = photo
        self.numberVideos = numberVideos
        self.numberFollowers = numberFollowers
        self.numberFollowings = numberFollowings
    }
}
