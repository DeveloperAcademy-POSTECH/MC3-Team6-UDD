//
//  IntroductionTextView.swift
//  UDD
//
//  Created by 최홍준 on 2022/07/20.
//

import Foundation
import UIKit

class IntroductionText: UITextView {
    // Setting Placeholder
    let placeHolderText = "한 줄 소개를 입력하세요."
    lazy var textView: UITextView = {
        let introductionText = UITextView()
        introductionText.font = .systemFont(ofSize: 16)
        introductionText.text = placeHolderText
        introductionText.textColor = .lightGray
        introductionText.backgroundColor = .systemGray6
        introductionText.delegate = self
        return introductionText
    }()
    // TextView 아래 글자 제한 표시
    lazy var remainCountLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .black
        textLabel.text = "0/150"
        textLabel.font = .systemFont(ofSize: 13)
        textLabel.textColor = .lightGray
        return textLabel
    }()
    // 화면을 누르면 키보드가 내려가게 하는 것
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textView.endEditing(true)
    }
    // 입력되는 글자 수 표현
    private func updateCountLabel(characterCount: Int) {
        remainCountLabel.text = "\(characterCount)/150"
        remainCountLabel
            .asColor(targetString: "\(characterCount)", color: characterCount == 0 ? .lightGray : .black)
    }
}
// PlaceHolder 구현
extension IntroductionText: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeHolderText {
            textView.text = nil
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = placeHolderText
            textView.textColor = .lightGray
            updateCountLabel(characterCount: 0)
        }
    }
    // 글자 수 150자 제한
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String)
        -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString)
                .trimmingCharacters(in: .whitespacesAndNewlines)
        let characterCount = newString.count
        guard characterCount <= 150 else { return false }
        updateCountLabel(characterCount: characterCount)
        return true
    }
}
extension UILabel {
    func asColor(targetString: String, color: UIColor?) {
        let fullText = text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: color as Any, range: range)
        attributedText = attributedString
    }
}
