//
//  YourCell.swift
//  UDD
//
//  Created by SeongHoon Jang on 2022/07/26.
//

import UIKit

class YourCell: UITableViewCell {
    @IBOutlet weak var yourTextView: UITextView!
    @IBOutlet weak var yourReceiveTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
