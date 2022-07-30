//
//  ChatInfoCell.swift
//  UDD
//
//  Created by SeongHoon Jang on 2022/07/28.
//

import UIKit

class ChatInfoCell: UITableViewCell {

    @IBOutlet weak var todayDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        todayDate.text = nowKorDate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
