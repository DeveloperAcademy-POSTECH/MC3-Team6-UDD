//
//  DogOwner.swift
//  UDD
//
//  Created by SeongHoon Jang on 2022/07/19.
//

import Foundation

struct DogOwner {
    let dogImage: String
    let dogName: String
    let dogHashTags: [String]
    let dogWeight: Double
//    let dogSex: String
    
}

extension DogOwner {
    static let dummy: DogOwner =
    DogOwner(dogImage: "golddog", dogName: "야옹이", dogHashTags: ["소심한", "중심한", "대심한", "청심환"], dogWeight: 25.3)
    
    static let personLike = false
}
