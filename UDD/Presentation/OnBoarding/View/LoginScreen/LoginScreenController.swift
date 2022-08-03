//
//  LoginScreenController.swift
//  UDD
//
//  Created by jiin on 2022/07/20.
//

import UIKit

class LoginScreenController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginStartButton(_ sender: UIButton) {
        presentTabBarVC()
    }

    private func presentTabBarVC() {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let vccc =
        storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        vccc.modalPresentationStyle = .fullScreen
        present(vccc, animated: false, completion: nil)
    }
}
