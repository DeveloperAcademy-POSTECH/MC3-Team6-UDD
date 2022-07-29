//
//  LikeListView.swift
//  UDD
//
//  Created by 최홍준 on 2022/07/27.
//

import UIKit

class LikeListView: UIViewController, UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var likeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var likeTableView: UITableView!

    // TableViewCell에 들어가는 더미 데이터를 2차원 배열로 구성
    var opponentDogLikeDataModel = Array(repeating: [OpponentDogLikeDataModel](), count: 2)
    var dogDataModel = DogDataModel(
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
        dogImage: "person"
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        likeTableView.register(LikeTableViewCell.nib(), forCellReuseIdentifier: LikeTableViewCell.identifier)
        likeTableView.delegate = self
        likeTableView.dataSource = self
        addDummy(name: "뽀삐", image: "golddog", isTrue: true)
        addDummy(name: "뽀식", image: "golddog", isTrue: true)
        addDummy(name: "빠니", image: "golddog", isTrue: false)
        addDummy(name: "브레드", image: "golddog", isTrue: false)
        addDummy(name: "죠지", image: "golddog", isTrue: false)
    }

    func addDummy(name: String, image: String, isTrue: Bool) {
        opponentDogLikeDataModel[(isTrue ? 0 : 1)].append(
            OpponentDogLikeDataModel(
                opponentDogName: name,
                opponentDogImage: image,
                opponentDogUUID: UUID().uuidString,
                isReceived: isTrue
            )
        )
    }

    // 0의 경우 Segmented Control에서 받은 좋아요에 해당, 1의 경우 보낸 좋아요에 해당
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch likeSegmentedControl.selectedSegmentIndex {
        case 0:
            return opponentDogLikeDataModel[0].count
        case 1:
            return opponentDogLikeDataModel[1].count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: LikeTableViewCell.identifier,
            for: indexPath
        ) as! LikeTableViewCell
        cell.configure(
            with: opponentDogLikeDataModel[likeSegmentedControl.selectedSegmentIndex][indexPath.row]
        )
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showLikeDetailView", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HomeDetailViewController {
//            destination.dogDataModel =
//            dogDataModel[(likeTableView.indexPathForSelectedRow?.row)!]
            // TableViewCell이 선택되자마자 deselect되게 함
            likeTableView.deselectRow(at: likeTableView.indexPathForSelectedRow!, animated: true)
        }
    }

    @IBAction func segmentedChange(_ sender: Any) {
        likeTableView.reloadData()
    }
}
