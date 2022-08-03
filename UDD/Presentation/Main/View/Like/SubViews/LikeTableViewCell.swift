//
//  LikeTableViewCell.swift
//  UDD
//
//  Created by 최홍준 on 2022/07/27.
//

import UIKit

class LikeTableViewCell: UITableViewCell {
    // TableViewCell 내 이미지와 라벨에 대한 아웃렛 설정
    @IBOutlet weak var opponentDogImage: UIImageView!
    @IBOutlet weak var opponentDogLabel: UILabel!

    // identifier 설정
    static let identifier = "LikeTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "LikeTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with model: OpponentDogLikeDataModel) {
        // TableViewCell에 들어갈 이미지
        self.opponentDogImage.image = UIImage(named: "golddog")
        //  OpponentDogLikeDataModel 내 Bool을 통해 '받은' 혹은 '보냈'으로 구분
        self.opponentDogLabel.text =
        "\(model.opponentDogName) 견주 님에게\n❤️를 \(model.isReceived == true ? "받았" : "보냈")습니다."
    }
}
