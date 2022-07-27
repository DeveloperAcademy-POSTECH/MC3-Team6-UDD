//
//  HalfModalButtonViewController.swift
//  UDD
//
//  Created by Kyubo Shim on 2022/07/25.
//

import UIKit

class HalfModalButtonViewController: UIViewController {

    @IBAction func presentViewController(_ sender: Any) {
        // 스토리보드 (FilterTag) 불러오고
        // 해당 스토리보드 안에 특정 StoryboardID 를 가진 뷰를 가져와서
        // FilterTagViewController 타입으로 초기화
        let filterVC: FilterTagViewController = .init()
        filterVC.loadViewIfNeeded()
        present(filterVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
