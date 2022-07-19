//
//  CustomTextField.swift
//  UDD
//
//  Created by Kyubo Shim on 2022/07/19.
//

import Foundation
import UIKit

class CustomTextFields : UITextField {
    let padding: CGFloat = 35
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setupUnderlinedTextField()
    }

    func setupUnderlinedTextField() {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width - 35, height: 1)
        bottomLayer.backgroundColor = UIColor.green.cgColor
        self.layer.addSublayer(bottomLayer)
    }
}
