//
//  OpponentDogLikeDataModel.swift
//  UDD
//
//  Created by 최홍준 on 2022/07/28.
//

import Foundation

// 받은 좋아요, 보낸 좋아요에 필요한 변수 설정
struct OpponentDogLikeDataModel {
    let opponentDogName: String // 다른 사용자 개 이름
    let opponentDogImage: String // 다른 사용자 개 사진
    let opponentDogUUID: String // 다른 사용자 uuid
    let isReceived: Bool // 다른 사용자에게 받은 ❤️ true
}
