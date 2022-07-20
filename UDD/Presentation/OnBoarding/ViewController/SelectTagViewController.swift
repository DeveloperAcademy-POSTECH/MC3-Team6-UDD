//
//  SelectTagViewController.swift
//  UDD
//
//  Created by Kyubo Shim on 2022/07/20.
//

import UIKit
import TTGTags

class SelectTagViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tagView = TTGTextTagCollectionView.init(frame: CGRect.init(x: 36,
                                                                       y: 150,
                                                                       width: UIScreen.main.bounds.width - 72,
                                                                       height: 300))
        // tagView.backgroundColor = UIColor.lightGraby
        self.view.addSubview(tagView)

        let strings = ["차분한", "소심한", "낯을가리는", "활동적인", "장난꾸러기", "주인을잘따르는", "예민한",
                       "애교쟁이", "경계심강한", "조용한", "똑똑한", "잘짖어요", "친화력강한"]
        tagView.alignment  = .left

        for text in strings {
            let content = TTGTextTagStringContent.init(text: text)
            content.textColor = UIColor.white
            content.textFont = UIFont.boldSystemFont(ofSize: 12)

            let normalStyle = TTGTextTagStyle.init()
            normalStyle.backgroundColor = UIColor.systemGray4
            normalStyle.cornerRadius = 7
            normalStyle.borderColor = UIColor.clear
            normalStyle.shadowColor = UIColor.clear
            normalStyle.extraSpace = CGSize.init(width: 20, height: 10)

            let selectedStyle = TTGTextTagStyle.init()
            selectedStyle.backgroundColor = UIColor(named: "AccentColor")!
            selectedStyle.borderColor = UIColor.clear
            selectedStyle.cornerRadius = 7
            selectedStyle.shadowColor = UIColor.clear
            selectedStyle.extraSpace = CGSize.init(width: 20, height: 10)

            let tags = TTGTextTag.init()
            tags.content = content
            tags.style = normalStyle
            tags.selectedStyle = selectedStyle

            tagView.addTag(tags)
        }

        tagView.reload()
    }
}
