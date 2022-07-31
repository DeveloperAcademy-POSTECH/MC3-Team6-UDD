//
//  AddDogDetailController.swift
//  UDD
//
//  Created by jiin on 2022/07/30.
//

import UIKit

class AddDogDetailController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var dogAgeTextField: CustomTextFields!
    @IBOutlet weak var dogBreedTextField: CustomTextFields!

    @IBOutlet weak var dogWeightTextField: CustomTextFields!
    @IBOutlet weak var imageSelectButton: UIButton! = {
        let button = UIButton()
        button.addTarget(self, action: #selector(presentAlbum), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// UIImagePickerControllerDelegate = 카메라 롤이나 앨범에서 사진을 가져올 수 있도록 도와 주는 것
extension AddDogDetailController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    @objc func presentAlbum() {
        let image = UIImagePickerController()
        image.sourceType = .photoLibrary
        image.delegate = self
        image.allowsEditing = true
        present(image, animated: true, completion: nil)
    }
    // PickerController 사용 후 발동
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
    [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage?
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지
        }

        self.imageView.image = newImage // 받아온 이미지로 update
        picker.dismiss(animated: true, completion: nil) // picker 닫기
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
