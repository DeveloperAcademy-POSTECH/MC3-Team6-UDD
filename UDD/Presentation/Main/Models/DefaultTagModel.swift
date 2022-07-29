//
//  DefaultTagModel.swift
//  UDD
//
//  Created by Kyubo Shim on 2022/07/28.
//

import Foundation

struct DefaultTag {
    static var shared: DefaultTag = DefaultTag()
    let defualtDaeJoongDo: [String] = ["대형견", "중형견", "소형견"]
    let defaultDogHashTag: [String] = ["차분한", "소심한", "낯을가리는", "활동적인", "장난꾸러기", "주인을잘따르는", "예민한",
                                       "애교쟁이", "경계심강한", "조용한", "똑똑한", "친화력강한"]
}

struct FilteredTag {
    static var sharedTag: FilteredTag = FilteredTag()
    var totalSelectedCount: Int = 0
    var selectedDogSize: [String] = []
    var selectedDogSizeIndex: [UInt] = []
    var selectedDogHashTag: [String] = []
    var selectedDogHashTagIndex: [UInt] = []
}
