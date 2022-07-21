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
    let dogBread: String    // 견종
    let dogImage: String    // 사진
}
