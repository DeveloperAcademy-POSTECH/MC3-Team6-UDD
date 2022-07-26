//
//  HomeViewController.swift
//  UDD
//
//  Created by 김민재 on 2022/07/19.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var table: UITableView!

    var dogDataModels = [DogDataModel]()

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
        dogDataModels.append(
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
        dogDataModels.append(
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
        dogDataModels.append(
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

    @IBAction func filterButtonOnClick(_ sender: Any) {
        let filterNum = returnNum()
        filterButton.setTitle(" 필터 \(filterNum != 0 ? "(\(filterNum))" : "")", for: .normal)
    }

    func returnNum() -> Int {
        return Int.random(in: 0..<10)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogDataModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PostTableViewCell.identifier,
            for: indexPath
        ) as! PostTableViewCell
        cell.configure(with: dogDataModels[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showHomeDetailView", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HomeDetailViewController {
            destination.dogDataModel = dogDataModels[(table.indexPathForSelectedRow?.row)!]
            table.deselectRow(at: table.indexPathForSelectedRow!, animated: true)
        }
    }
}
