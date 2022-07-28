//
//  LikeTableViewCell.swift
//  UDD
//
//  Created by 최홍준 on 2022/07/27.
//

import UIKit

class LikeTableViewCell: UITableViewCell {
    @IBOutlet weak var opponentDogImage: UIImageView!
    @IBOutlet weak var opponentDogLabel: UILabel!
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
        self.opponentDogImage.image = UIImage(named: "golddog")
        self.opponentDogLabel.text =
        "\(model.opponentDogName) 견주 님에게\n❤️를 \(model.isReceived == true ? "받았" : "보냈")습니다."
    }
}
