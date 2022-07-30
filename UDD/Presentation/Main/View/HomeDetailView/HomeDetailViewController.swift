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

    var dogDataModel: DogDataModel!
    var isDisabled: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        dogImage.image = UIImage(named: dogDataModel.dogImage)
        dogName.text = dogDataModel.dogName
        dogTags.text = dogTagsString()
        dogDistance.text = "\(dogDataModel.userAddress)"
        dogGender.text = dogDataModel.dogSex
        dogAge.text = calcAgeString(birthday: dogDataModel.dogBirth)
        dogBreed.text = dogDataModel.dogBreed
        dogWeightInfo.text = dogSizeString(weight: dogDataModel.dogWeight)
        dogInfo.text = dogDataModel.dogInfo
        personInfo.text = "\(dogDataModel.dogName) 견주님 [\(dogDataModel.userAge)]"
        navigationItem.largeTitleDisplayMode = .never
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
        for tagg in dogDataModel.dogHashtags {
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
