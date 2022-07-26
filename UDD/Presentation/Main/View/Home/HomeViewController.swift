//
//  HomeViewController.swift
//  UDD
//
//  Created by 김민재 on 2022/07/19.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    var models = [DogDataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        table.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        addDummy1()
        addDummy2()
        addDummy3()

    }

    func addDummy1() {
        models.append(
            DogDataModel(
                uuid: UUID().uuidString,
                dogName: "땡구",
                dogBirth: Date(),
                dogSex: "중성화",
                dogWeight: 1.2,
                dogHashtags: ["#소심한", "#조용한", "#경계심강한", "#애교쟁이"],
                dogInfo: "나는야 우주최강 귀요미~ 땡구 와쪄염 뿌우",
                userAge: 3,
                userSex: "남성",
                userAddress: "1.2km",
                dogBreed: "골든 리트리버",
                dogImage: "golddog"
            )
        )
    }

    func addDummy2() {
        models.append(
            DogDataModel(
                uuid: UUID().uuidString,
                dogName: "땡칠",
                dogBirth: Date(),
                dogSex: "남",
                dogWeight: 5,
                dogHashtags: ["#참돔", "#생선까스", "#선넘어", "#안좋아해"],
                dogInfo: "나는야 우주최강 귀요미~ 땡칠 와쪄염 뿌우",
                userAge: 48,
                userSex: "남성",
                userAddress: "0.2km",
                dogBreed: "시바견",
                dogImage: "golddog"
            )
        )
    }

    func addDummy3() {
        models.append(
            DogDataModel(
                uuid: UUID().uuidString,
                dogName: "체리",
                dogBirth: Date(),
                dogSex: "여",
                dogWeight: 0.7,
                dogHashtags: ["#소심한", "#조용한", "#경계심강한", "#애교쟁이"],
                dogInfo: "나는야 우주최강 귀요미~ 땡구 와쪄염 뿌우",
                userAge: 1,
                userSex: "여성",
                userAddress: "2km",
                dogBreed: "미니 푸들",
                dogImage: "golddog"
            )
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PostTableViewCell.identifier,
            for: indexPath
        ) as! PostTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
}
