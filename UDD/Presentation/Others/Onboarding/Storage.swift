//
//  Storage.swift
//  UDD
//
//  Created by SeongHoon Jang on 2022/07/31.
//

import Foundation

/// UserDefauls 관련 Stroage
/// isFirstTime(): isFirstTime키에 저장된 값이 없다면 No를 set하고 true 반환한다.
/// 값이 있다면 false를 return (온보딩 스킵)
public class Storage {
    static func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTime") == nil {
            defaults.set("No", forKey:"isFirstTime")
            return true
        } else {
            return false
        }
    }
}
