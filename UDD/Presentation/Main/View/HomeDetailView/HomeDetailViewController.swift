//
//  HomeDetailViewController.swift
//  UDD
//
//  Created by SeongHoon Jang on 2022/07/19.
//

import UIKit

class HomeDetailViewController: UIViewController {
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogDistance: UILabel!
    @IBOutlet weak var dogTags: UILabel!
    @IBOutlet weak var dogGender: UILabel!
    @IBOutlet weak var dogAge: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    @IBOutlet weak var dogWeightInfo: UILabel!
    @IBOutlet weak var dogInfo: UILabel!
    @IBOutlet weak var personInfo: UILabel!
    @IBOutlet weak var likeButton: UIButton!

    var dogDataModel: DogDataModel?
    var dogDummy = DogDataModel.dummy
    var isDisabled: Bool = DogDataModel.personLike

    override func viewDidLoad() {
        super.viewDidLoad()
        dogImage.image = UIImage(named: dogDummy.dogImage)
        dogName.text = dogDummy.dogName
        dogTags.text = dogTagsString()
        dogDistance.text = "\(dogDummy.userAddress)km"
        dogGender.text = dogDummy.dogSex
        dogAge.text = calcAgeString(birthday: dogDummy.dogBirth)
        dogBreed.text = dogDummy.dogBreed
        dogWeightInfo.text = dogSizeString(weight: dogDummy.dogWeight)
        dogInfo.text = dogDummy.dogInfo
        personInfo.text = "\(dogDummy.dogName) 견주님 [\(dogDummy.userAge)]"
    }

    @IBAction func likeButtonAction(_ sender: UIButton) {
        changeLikeState()
    }

    func changeLikeState() {
        let imgName = isDisabled ? "heart" : "heart.fill"
        isDisabled.toggle()
        self.likeButton.setImage(UIImage(systemName: imgName), for: .normal)
    }

    func dogTagsString() -> String {
        var dogData = ""
//        dogDummy.dogHashtags
        for tagg in dogDummy.dogHashtags {
            dogData += "#\(tagg)  "
        }
        return dogData
    }

    func dogSizeString(weight: Float) -> String {
        let dogSize : String
        if weight < 10 {
            dogSize = "소형견"
        } else if weight < 25 {
            dogSize = "중형견"
        } else {
            dogSize = "대형견"
        }
        return "\(weight) kg (\(dogSize))"
    }

    // 나이 계산 로직
    func calcAgeString(birthday: Date) -> String {
        let year = Calendar.current.dateComponents([.year], from: birthday, to: Date()).year ?? 0
        if year == 0 {
            let month = Calendar.current.dateComponents([.month], from: birthday, to: Date()).month ?? 0
            return "\(month)개월"
        }
        return "\(year)살"
    }
}
