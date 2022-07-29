//
//  DogDataModel.swift
//  UDD
//
//  Created by 김민재 on 2022/07/19.
//

import Foundation

struct DogDataModel {
    let uuid: String   // id
    let dogName: String // 개 이름
    let dogBirth: Date  // 개 생년월일
    let dogSex: String  // 개 성별
    let dogWeight: Float    // 개 몸무게
    let dogHashtags: [String]   // 개 성격 태그
    let dogInfo: String // 개 한 줄 소개
    let userAge: Int    // 견주 나이
    let userSex: String // 견주 성별
    let userAddress: String // 주소
    let dogBreed: String    // 견종
    let dogImage: String    // 사진
}

extension DogDataModel {
    static let dummy = DogDataModel(
        uuid: UUID().uuidString,
        dogName: "고양이",
        dogBirth: Calendar.current.date(byAdding: .year, value: -1, to: Date())!,
        dogSex: "중성화",
        dogWeight: 25.3,
        dogHashtags: ["소심한", "중심한", "대심한", "청심환"],
        dogInfo: "우리 개는 울때 야옹하면서 울어요",
        userAge: 25, userSex: "중성화",
        userAddress: "42.195",
        dogBreed: "골든 리트리버",
        dogImage: "golddog")
    static let personLike = false
}
