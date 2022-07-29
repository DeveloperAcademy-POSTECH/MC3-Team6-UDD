//
//  FilterTagViewController.swift
//  UDD
//
//  Created by Kyubo Shim on 2022/07/25.
//

import UIKit
import TTGTags
import SwiftUI

class FilterTagViewController: UIViewController, UIViewControllerTransitioningDelegate {
    var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        modalPresentationStyle = .custom
        transitioningDelegate = self
        
        // MARK: 관심 태그 레이블
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 28).isActive = true
        
        // MARK: 제목과 본문의 경계선
        
        let lineVC = UIHostingController(rootView: LineView())
        addChild(lineVC)
        let borderLine: UIView = lineVC.view
        view.addSubview(borderLine)
        borderLine.translatesAutoresizingMaskIntoConstraints = false
        borderLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        borderLine.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20.5).isActive = true
        
        // MARK: 강아지 크기 부제목
        
        view.addSubview(dogSizeLabel)
        dogSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        dogSizeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        dogSizeLabel.topAnchor.constraint(equalTo: borderLine.bottomAnchor, constant: 20.5).isActive = true
        
        // MARK: 강아지 크기 해시태그 선택
        
        view.addSubview(dogSizeHashTag)
        dogSizeHashTag.translatesAutoresizingMaskIntoConstraints = false
        dogSizeHashTag.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        dogSizeHashTag.topAnchor.constraint(equalTo: dogSizeLabel.bottomAnchor, constant: 20.5).isActive = true
        
        // MARK: 강아지 성격 해시태그 부제목
        
        view.addSubview(dogHashTagLabel)
        dogHashTagLabel.translatesAutoresizingMaskIntoConstraints = false
        dogHashTagLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        dogHashTagLabel.topAnchor.constraint(equalTo: dogSizeHashTag.bottomAnchor, constant: 20.5).isActive = true
        
        // MARK: 강아지 성격 해시태그 선택
        
        view.addSubview(dogHashTag)
        dogHashTag.translatesAutoresizingMaskIntoConstraints = false
        dogHashTag.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        dogHashTag.topAnchor.constraint(equalTo: dogHashTagLabel.bottomAnchor, constant: 20.5).isActive = true
        
        // MARK: 선호 거리 범위 부제목
        
        view.addSubview(distanceLabel)
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        distanceLabel.topAnchor.constraint(equalTo: dogHashTag.bottomAnchor, constant: 20.5).isActive = true
        
        // MARK: 선호 거리 범위 슬라이더
        
        view.addSubview(distanceSlider)
        distanceSlider.translatesAutoresizingMaskIntoConstraints = false
        distanceSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        distanceSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -28).isActive = true
        distanceSlider.topAnchor.constraint(equalTo: distanceLabel.bottomAnchor, constant: 20.5).isActive = true
        
        // MARK: 하단 경계선
        
        let bottomLineVC = UIHostingController(rootView: LineView())
        addChild(bottomLineVC)
        let bottomBorderLine: UIView = bottomLineVC.view
        view.addSubview(bottomBorderLine)
        bottomBorderLine.translatesAutoresizingMaskIntoConstraints = false
        bottomBorderLine.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        bottomBorderLine.topAnchor.constraint(equalTo: distanceSlider.bottomAnchor, constant: 8.5).isActive = true
        
        // MARK: 확인 버튼
        
        view.addSubview(confirmButton)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 28).isActive = true
        confirmButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -28).isActive = true
        // confirmButton.topAnchor.constraint(equalTo: bottomBorderLine.bottomAnchor, constant: 8.5).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        confirmButton.addTarget(self, action: #selector(printSelectedTag(_:)), for: .touchUpInside)
        confirmButton.tag = 1234
        
        print(FilteredTag.sharedTag.selectedDogSize)
    }

    lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height:0))
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.text = "관심 태그"
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var dogSizeLabel: UILabel = {
        let label: UILabel = UILabel(frame: CGRect(x: 25, y: 100, width: 0, height:0))
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.text = "강아지 크기"
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.textAlignment = .left
        
        return label
    }()

    var dogSizeHashTag: TTGTextTagCollectionView =  {
        let tagView: TTGTextTagCollectionView = TTGTextTagCollectionView(frame: CGRect(x: 28, y: 200, width: UIScreen.main.bounds.width - 72, height: 300))
        let defaultTag = DefaultTag()
        let strings = defaultTag.defualtDaeJoongDo
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

        for index in FilteredTag.sharedTag.selectedDogSizeIndex {
            tagView.updateTag(at: index, selected: true)
        }
        
        tagView.reload()
        return tagView
    }()
    
    
    var dogHashTagLabel: UILabel = {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.text = "강아지 성격"
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.textAlignment = .left
        return label
    }()
    
    var dogHashTag: TTGTextTagCollectionView =  {
        let tagView: TTGTextTagCollectionView = TTGTextTagCollectionView(frame: CGRect(x: 28, y: 200, width: UIScreen.main.bounds.width - 72, height: 300))
        let defaultTag = DefaultTag()
        let strings = defaultTag.defaultDogHashTag
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

        for index in FilteredTag.sharedTag.selectedDogHashTagIndex {
            tagView.updateTag(at: index, selected: true)
        }

        tagView.reload()
        return tagView
    }()
    
    lazy var distanceLabel: UILabel = {
        let label: UILabel = UILabel(frame: CGRect(x: 25, y: 100, width: 0, height:0))
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.text = "거리 범위"
        label.numberOfLines = 0
        label.layer.masksToBounds = true
        label.textAlignment = .left
        
        return label
    }()
    
    
    lazy var distanceSlider: UISlider = {
        let distanceSlider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 10))
        distanceSlider.minimumValue = 1.0
        distanceSlider.maximumValue = 50.0
        distanceSlider.isContinuous = true
        distanceSlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        
        return distanceSlider
    }()
    
    @objc func sliderValueDidChange(_ sender: UISlider!){
        let step: Float = 5
        print("Slider value changed!")
        let roundedStepValue = round(sender.value / step) * step
        sender.value = roundedStepValue
        print("Slider step value \(Int(roundedStepValue))")
    }
    
    @objc func printSelectedTag(_ sender: UIButton) {
        let defaultTag = DefaultTag()
        let dogSizeArr: [String] = defaultTag.defualtDaeJoongDo
        let dogHashTagArr: [String] = defaultTag.defaultDogHashTag
        
        FilteredTag.sharedTag.totalSelectedCount = 0
        FilteredTag.sharedTag.selectedDogSizeIndex.removeAll()
        FilteredTag.sharedTag.selectedDogHashTagIndex.removeAll()
        FilteredTag.sharedTag.selectedDogSize.removeAll()
        FilteredTag.sharedTag.selectedDogHashTag.removeAll()
        
        let selectedDogSizeResult = dogSizeHashTag.allSelectedTags()
        let selectedDogHashTagResult = dogHashTag.allSelectedTags()
        
        let selectedDogSizeCount:Int = selectedDogSizeResult?.count ?? 9999999
        let selectedDogHashTagCount:Int = selectedDogHashTagResult?.count ?? 9999999
        let totalSelectedCount: Int = selectedDogSizeCount + selectedDogHashTagCount
        
        print("선택된 강아지 사이즈 개수 >> \(selectedDogSizeCount)")
        print("선택된 강아지 성격 개수 >> \(selectedDogHashTagCount)")
        print("선택된 개수 도합 >> \(selectedDogSizeCount + selectedDogHashTagCount)")
        
        FilteredTag.sharedTag.totalSelectedCount = totalSelectedCount
        
        for index in 0 ..< selectedDogSizeCount {
            let content = selectedDogSizeResult?[index].content as? TTGTextTagStringContent
            FilteredTag.sharedTag.selectedDogSize.append(content!.text)
            FilteredTag.sharedTag.selectedDogSizeIndex.append(UInt(dogSizeArr.index(of: content!.text) ?? 999999))
            print(content!.text)
        }
        print(FilteredTag.sharedTag.selectedDogSize)
        
        for index in 0 ..< selectedDogHashTagCount {
            let content = selectedDogHashTagResult?[index].content as? TTGTextTagStringContent
            FilteredTag.sharedTag.selectedDogHashTag.append(content!.text)
            FilteredTag.sharedTag.selectedDogHashTagIndex.append(UInt(dogHashTagArr.index(of: content!.text) ?? 9999999))
            print(content!.text)
        }
        dismiss(animated: true, completion: nil)
    }
    
    lazy var confirmButton: UIButton = {
        let confirmButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        confirmButton.backgroundColor = .orange
        confirmButton.setTitle("적용", for: .normal)
        confirmButton.setTitleColor(.white, for: .normal)
        
        return confirmButton
    }()

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        let controller: UISheetPresentationController = .init(presentedViewController: presented,
                                                              presenting: presenting)
        let customDetent: UISheetPresentationController.Detent = ._detent(withIdentifier: "customDetent",
                                                                          constant: 505)
        controller.detents = [customDetent]
        controller.prefersGrabberVisible = true
        return controller
    }
    
}
