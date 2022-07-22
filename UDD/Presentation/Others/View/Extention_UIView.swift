//
//  Extention_UIView.swift
//  MC3Study
//
//  Created by SeongHoon Jang on 2022/07/17.
//

import UIKit

//  https://gist.github.com/motgi/be578f2ef766c941f03a037a35f36660#file-uiview-swift-L26
extension UIView {

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let uiBorderColor = newValue else { return }
            layer.borderColor = uiBorderColor.cgColor
        }
    }
}
