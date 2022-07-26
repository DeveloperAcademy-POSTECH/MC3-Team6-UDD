//
//  PostTableViewCell.swift
//  UDD
//
//  Created by 김민재 on 2022/07/19.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var dogImageView: UIImageView!
    @IBOutlet var dogNameLabel: UILabel!
    @IBOutlet var dogSexLabel: UILabel!
    @IBOutlet var dogDistanceLabel: UILabel!
    @IBOutlet var dogHashtag1Label: UILabel!
    @IBOutlet var dogHashtag2Label: UILabel!
    @IBOutlet var dogHashtag3Label: UILabel!
    @IBOutlet var dogHashtag4Label: UILabel!

    static let identifier = "PostTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with model: DogDataModel) {
        self.dogImageView.image = UIImage(named: model.dogImage)
        self.dogNameLabel.text = "\(model.dogName)"
        self.dogSexLabel.text = "\(model.dogSex)"
        self.dogDistanceLabel.text = "\(model.userAddress)"
        self.dogHashtag1Label.text = "\(model.dogHashtags[0])"
        self.dogHashtag2Label.text = "\(model.dogHashtags[1])"
        self.dogHashtag3Label.text = "\(model.dogHashtags[2])"
        self.dogHashtag4Label.text = "\(model.dogHashtags[3])"
    }

}
