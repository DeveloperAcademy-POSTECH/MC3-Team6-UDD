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
    @IBOutlet weak var dogTags: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dogWeightInfo: UILabel!
    @IBOutlet weak var dogInfo: UILabel!
    @IBOutlet weak var personInfo: UILabel!

    var dogDataModel: DogDataModel?
    var dogDummy: DogOwner = DogOwner.dummy
    var isDisabled: Bool = DogOwner.personLike
    override func viewDidLoad() {
        super.viewDidLoad()
        dogImage.image = UIImage(named: dogDummy.dogImage)
        dogName.text = dogDummy.dogName
        dogTags.text = dogTagsString()
        dogWeightInfo.text = dogSizeString(weight: dogDummy.dogWeight)
        dogInfo.text = "정보 한줄 소개정보 한줄 소개정보 한줄 소개정보 한줄 소개정보 한줄 소개정보 한줄 소개정보 한줄 소개"
        personInfo.text = "나칠땡  [24]"
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
        for tagg in dogDummy.dogHashTags {
            dogData += "#\(tagg)  "
        }
        return dogData
    }
    func dogSizeString(weight: Double) -> String {
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
}
