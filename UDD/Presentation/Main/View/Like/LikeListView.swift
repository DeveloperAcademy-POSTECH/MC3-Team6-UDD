//
//  LikeListView.swift
//  UDD
//
//  Created by 최홍준 on 2022/07/27.
//

import UIKit

class LikeListView: UITableViewCell {
    @IBOutlet weak var opponentImage: UIImageView!
    @IBOutlet weak var opponentLabel1: UILabel!
    @IBOutlet weak var opponentLabel2: UILabel!
    
    func configure(name: String, imageName: String) {
        opponentLabel1.text = name
        opponentImage.image = UIImage(named: imageName)
    }
}
