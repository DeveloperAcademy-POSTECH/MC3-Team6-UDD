//
//  AddUserDataViewController.swift
//  UDD
//
//  Created by 최홍준 on 2022/07/21.
//

import UIKit

class AddUserDataViewController: UIViewController {

    @IBAction func addUserBirthTextField(_ sender: CustomTextFields) {
    }
    @IBAction func addUserAdressTextField(_ sender: CustomTextFields) {
    }
    @IBAction func finishSaveButton(_ sender: UIButton) {
        presentTabBarVC()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func presentTabBarVC() {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let vccc =
        storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        vccc.modalPresentationStyle = .fullScreen
        present(vccc, animated: false, completion: nil)
    }

}
